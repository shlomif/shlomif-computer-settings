#!/usr/bin/env perl

# Based upon /usr/bin/urpmq from Mageia Linux.

#- Copyright (C) 2000, 2001, 2002, 2003, 2004, 2005 MandrakeSoft SA
#- Copyright (C) 2005-2010 Mandriva SA
#-
#- This program is free software; you can redistribute it and/or modify
#- it under the terms of the GNU General Public License as published by
#- the Free Software Foundation; either version 2, or (at your option)
#- any later version.
#-
#- This program is distributed in the hope that it will be useful,
#- but WITHOUT ANY WARRANTY; without even the implied warranty of
#- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#- GNU General Public License for more details.
#-
#- You should have received a copy of the GNU General Public License
#- along with this program; if not, write to the Free Software
#- Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.

#- this program is based upon urpmi.

use strict;
use warnings;

use urpm;
use urpm::args;
use urpm::msg;
use urpm::sys;
use urpm::util qw(any cat_ put_in_hash uniq_);
use urpm::media;
use urpm::select;
use urpm::get_pkgs;

my %installed;

BEGIN
{
    %installed = ( map { chomp; $_ => 1 } `rpm -qa --qf "%{n}\\n"` );
    push @ARGV, sort keys %installed;
}

our @files;
our @names;
our @src_names;

sub escape_shell ($)
{
    my ($s) = @_;
    if ( $s =~ /\s|'|"/ )
    {
        $s =~ s/"/\\"/g;
        $s = qq("$s");
    }
    else
    {
        return $s;
    }
}

#- parse arguments list.
my $urpm = urpm->new_parse_cmdline or exit(1);

#- we really don't want logs on stdout, and remove verbose if not asked.
$urpm->{info} = sub { print STDERR "$_[0]\n" };
$urpm->{log}  = sub { print STDERR "$_[0]\n" }
    if $options{verbose} > 0;

my $only_list_name = $options{list}
    && !( $options{version}
    || $options{release}
    || $options{arch}
    || $options{group} );

#- improve speed if using any list_... options.
$options{nodepslist} =
       $options{list_aliases}
    || $options{list_nodes}
    || $options{list_media}
    || $options{dump_config}
    || $only_list_name # urpmq will parse synthesis only if names.* are not already there
    || $options{list_url};
$options{nolock} = 1 if $options{nodepslist};

#- print sub for query.
my $pkg_to_string = sub {
    my ($pkg) = @_;
    my $str = '';
    $options{group} and $str .= $pkg->group . '/';
    $str .= $pkg->name;
    $options{version} and $str .= '-' . $pkg->version;
    $options{release} and $str .= '-' . $pkg->release;
    $options{arch}    and $str .= '.' . $pkg->arch;
    $str;
};

if ( $options{auto_orphans} )
{
    !@names && !@src_names
        or $urpm->{fatal}
        ( 1, N("usage: \"urpmq --auto-orphans\" with no argument") );
    $options{env}
        and $urpm->{fatal}
        ( 1, N( "Can't use %s with %s", '--env', '--auto-orphans' ) );
    require urpm::orphans;
    my $orphans = urpm::orphans::get_orphans($urpm);
    print "$_\n" foreach sort map { $pkg_to_string->($_) } @$orphans;
    exit $urpm::postponed_code;
}

if ( $options{env} )
{
    print N( "using specific environment on %s\n", $options{env} );

    #- setting new environment.
    $urpm->{config}             = "$options{env}/urpmi.cfg";
    $urpm->{skiplist}           = "$options{env}/skip.list";
    $urpm->{instlist}           = "$options{env}/inst.list";
    $urpm->{prefer_list}        = "$options{env}/prefer.list";
    $urpm->{prefer_vendor_list} = "$options{env}/prefer.vendor.list";
    $urpm->{statedir}           = $options{env};
}

#- should we ignore arch compatibility
if ( $options{ignorearch} ) { urpm::shunt_ignorearch() }

my $rpm_lock =
       ( $options{upgrade} || $options{not_available} )
    && !$options{env}
    && !$options{nolock}
    && urpm::lock::rpm_db( $urpm, '', wait => $options{wait_lock} );
my $urpmi_lock = !$options{nolock}
    && urpm::lock::urpmi_db( $urpm, '', wait => $options{wait_lock} );
urpm::media::configure(
    $urpm,
    nodepslist       => $options{nodepslist},
    media            => $options{media},
    searchmedia      => $options{searchmedia},
    excludemedia     => $options{excludemedia},
    sortmedia        => $options{sortmedia},
    synthesis        => $options{synthesis},
    update           => $options{update},
    parallel         => $options{parallel},
    probe_with       => $options{probe_with},
    usedistrib       => $options{usedistrib},
    cmdline_skiplist => $options{skip},
);

my $state = {};
my %requested;

{
    %requested = $urpm->register_rpms(@files);

    my $search_packages = sub {
        my ( $names, %more_options ) = @_;

        urpm::select::search_packages(
            $urpm,
            \%requested, $names,
            use_provides    => $options{use_provides},
            fuzzy           => $urpm->{options}{fuzzy},
            caseinsensitive => $options{caseinsensitive},
            all             => $options{all},
            %more_options,
        );
    };

    #- search the packages according to the selection given by the user.
    if (@names)
    {
        $search_packages->( \@names ) or $options{force} or exit 1;
    }
    if (@src_names)
    {
        $search_packages->( \@src_names, src => 1 )
            or $options{force}
            or exit 1;
    }

    #- keep track of choices, don't propagate but mark them selected.
    my $stop_on_choices = sub {
        my ( undef, undef, $state_, $choices ) = @_;
        $state_->{selected}{ join '|',
            sort { $a <=> $b } map { $_ ? $_->id : () } @$choices } = 0;
    };

 #- open/close of database should be moved here, in order to allow testing
 #- some bogus case and check for integrity. (note auto_select implies upgrade).
    if (1)
    {
        #- search for packages that require one of the proposed packages.
        my ( @properties, %requires, %properties, $dep );

   #- keep in mind the requested id (if given) in order to prefer these packages
   #- on choices instead of anything other one.
        @properties = keys %requested;

        if (@properties)
        {
            #- build a requires to packages id hash.
            foreach my $pkg ( @{ $urpm->{depslist} } )
            {
                foreach ( $pkg->requires_nosense )
                {
                    $requires{$_}{ $pkg->id } = undef;
                }
            }

#- for each dep property evaluated, examine which package will be obsoleted on $db,
#- then examine provides that will be removed (which need to be satisfied by another
#- package present or by a new package to upgrade), then requires not satisfied and
#- finally conflicts that will force a new upgrade or a remove.
            while ( defined( $dep = shift @properties ) )
            {
                #- take the best package for each choices of same name.
                foreach ( $urpm->find_candidate_packages_($dep) )
                {
                    my ( $best_requested, $best );
                    foreach (@$_)
                    {
                        if ( $best_requested || exists $requested{ $_->id } )
                        {
                            if ( $best_requested && $best_requested != $_ )
                            {
                                $_->compare_pkg($best_requested) > 0
                                    and $best_requested = $_;
                            }
                            else
                            {
                                $best_requested = $_;
                            }
                        }
                        elsif ( $best && $best != $_ )
                        {
                            $_->compare_pkg($best) > 0 and $best = $_;
                        }
                        else
                        {
                            $best = $_;
                        }
                    }

                    #- examine all proposed choices.
                    my $pkg = $best_requested || $best or next;
                    exists $state->{selected}{ $pkg->id } and next;
                    $state->{selected}{ $pkg->id } = undef;

                    next
                        if !$requested{$dep}
                        && !$options{what_requires_recursive};

                 #- for all provides of package, look up what is requiring them.
                    foreach ( $pkg->provides )
                    {
                        if ( my ( $n, $s ) =
                            /^([^\s\[]*)(?:\[\*\])?\[?([^\s\]]*\s*[^\s\]]*)/ )
                        {
                            if (
                                my @l =
                                grep { $_ ne $pkg->name }
                                map  { $_->name } $urpm->packages_providing($n)
                                )
                            {
          #- If another package provides this requirement,
          #- then don't bother finding stuff that needs it as it will be invalid
                                $urpm->{log}(
                                    sprintf
"skipping package(s) requiring %s via %s, since %s is also provided by %s",
                                    $pkg->name, $n, $n, join( ' ', @l )
                                );
                                next;
                            }

                            foreach (
                                map { $urpm->{depslist}[$_] }
                                grep {
                                           !exists $state->{selected}{$_}
                                        && !exists $properties{$_}
                                }
                                keys %{ $requires{$n} || {} }
                                )
                            {
                                if (
                                    any { URPM::ranges_overlap( "$n $s", $_ ) }
                                    $_->requires
                                    )
                                {
                                    push @properties, $_->id;
                                    $urpm->{debug} and $urpm->{debug}(
                                        sprintf
                                            "adding package %s (requires %s%s)",
                                        $_->name,
                                        $pkg->name,
                                        $n eq $pkg->name ? '' : " via $n"
                                    );
                                    $properties{ $_->id } = undef;
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    my %need_xml_info;
    $need_xml_info{info}      = 1 if $options{info} || $options{sourcerpm};
    $need_xml_info{files}     = 1 if $options{files};
    $need_xml_info{changelog} = 1 if $options{changelog};

    if ( $options{sources} || %need_xml_info )
    {
        my ( $local_sources, $blists ) =
            urpm::get_pkgs::selected2local_and_blists( $urpm,
            $state->{selected} );
        my %xml_info_pkgs;

        if (%need_xml_info)
        {
            # get descriptions of update sources
            my $updates_descr = urpm::get_updates_description($urpm);

            foreach my $blist (@$blists)
            {
                my $medium = $blist->{medium};
                my @pkgs   = values %{ $blist->{pkgs} } or next;

                if ( my $dir = urpm::file_from_local_url( $medium->{url} ) )
                {
                    $urpm->{log}("getting information from rpms from $dir");
                    $local_sources->{ $_->id } = "$dir/" . $_->filename
                        foreach @pkgs;
                }
                else
                {
                    foreach my $xml_info ( grep { $need_xml_info{$_} } 'info',
                        'files', 'changelog' )
                    {
                        if (
                            my $xml_info_file = urpm::media::any_xml_info(
                                $urpm,     $medium,
                                $xml_info, $options{verbose} < 0
                            )
                            )
                        {
                            require urpm::xml_info;
                            require urpm::xml_info_pkg;
                            $urpm->{log}
                                ("getting information from $xml_info_file");
                            my %nodes =
                                urpm::xml_info::get_nodes( $xml_info,
                                $xml_info_file,
                                [ map { scalar $_->fullname } @pkgs ] );
                            put_in_hash( $xml_info_pkgs{ $_->id } ||= {},
                                $nodes{ $_->fullname } )
                                foreach @pkgs;
                        }
                        else
                        {
                            my $pkgs_text = join( ' ', map { $_->name } @pkgs );
                            if ( $xml_info eq 'info' )
                            {
                                $urpm->{info}(
                                    int(@pkgs) == 1
                                    ? N(
"no xml info for medium \"%s\", only partial result for package %s",
                                        $medium->{name},
                                        $pkgs_text
                                        )
                                    : N(
"no xml info for medium \"%s\", only partial result for packages %s",
                                        $medium->{name},
                                        $pkgs_text
                                    )
                                );
                            }
                            else
                            {
                                $urpm->{error}(
                                    int( @pkgs == 1 )
                                    ? N(
"no xml info for medium \"%s\", unable to return any result for package %s",
                                        $medium->{name},
                                        $pkgs_text
                                        )
                                    : N(
"no xml info for medium \"%s\", unable to return any result for packages %s",
                                        $medium->{name},
                                        $pkgs_text
                                    )
                                );
                            }
                        }
                    }
                }
            }
            foreach ( keys %{ $state->{selected} } )
            {
                foreach my $id ( split /\|/, $_ )
                {
                    my $pkg = $urpm->{depslist}[$id] or next;

                 #- even if non-root, search for a header in the global cachedir
                    my $file = $local_sources->{$id};
                    if ( -s $file )
                    {
                        $pkg->update_header( $file, keep_all_tags => 1 );
                    }
                    elsif ( $xml_info_pkgs{$id} )
                    {
                        # using the proxy urpm::xml_info_pkg object
                        $pkg = urpm::xml_info_pkg->new( $xml_info_pkgs{$id},
                            $pkg );
                    }
                    if ( $options{info} )
                    {
                        printf "%-12s: %s\n", "Name",    $pkg->name;
                        printf "%-12s: %s\n", "Version", $pkg->version;
                        printf "%-12s: %s\n", "Release", $pkg->release;
                        printf "%-12s: %s\n", "Group",   $pkg->group;
                        printf "%-12s: %-28s %12s: %s\n", "Size", $pkg->size,
                            "Architecture", $pkg->arch;
                        if ( $pkg->sourcerpm || $pkg->buildhost )
                        {
                            if ( $pkg->sourcerpm && $pkg->buildhost )
                            {
                                printf "%-12s: %-28s %12s: %s\n", "Source RPM",
                                    $pkg->sourcerpm, "Build Host",
                                    $pkg->buildhost;
                            }
                            elsif ( $pkg->sourcerpm )
                            {
                                $pkg->sourcerpm
                                    and printf "%-12s: %s\n", "Source RPM",
                                    $pkg->sourcerpm;
                            }
                            else
                            {
                                $pkg->sourcerpm
                                    and printf "%-12s: %s\n", "Build Host",
                                    $pkg->buildhost;
                            }
                        }
                        $pkg->packager
                            and printf "%-12s: %s\n", "Packager",
                            $pkg->packager;
                        $pkg->url and printf "%-12s: %s\n", "URL", $pkg->url;
                        $pkg->summary
                            and printf "%-12s: %s\n", "Summary", $pkg->summary;

                        my $updesc = do
                        {
                            my $media = URPM::pkg2media( $urpm->{media}, $pkg );
                            $media
                                && $updates_descr->{ $media->{name} }
                                { $pkg->name };
                        };
                        if ( my $description = $updesc && $updesc->{description}
                            || $pkg->description )
                        {
                            printf "%-12s:\n%s\n", "Description", $description;
                        }
                        if ($updesc)
                        {
                            $updesc->{updated}
                                and printf "%-20s: %s\n", "Last updated",
                                $updesc->{updated};
                            $updesc->{importance}
                                and printf "%-20s: %s\n", "Update importance",
                                $updesc->{importance};
                            $updesc->{pre}
                                and printf "%-20s:\n%s\n", "Reason for update",
                                $updesc->{pre};
                        }
                    }
                    if ( $options{files} )
                    {
                        if ( $pkg->files )
                        {
                            print join( "\n", $pkg->files ) . "\n";
                        }
                    }
                    if ( my @tags = grep { $options{$_} } 'sourcerpm' )
                    {
                        print $pkg->name, ': ', $pkg->$_, "\n" foreach @tags;
                    }
                    if ( $options{changelog} )
                    {
                        if ( my @changelogs = $pkg->changelogs )
                        {
                            foreach (@changelogs)
                            {
                                print "* "
                                    . urpm::msg::localtime2changelog(
                                    $_->{time} )
                                    . " $_->{name}\n$_->{text}\n\n";
                            }
                        }
                        else
                        {
                            print STDERR N("No changelog found\n");
                        }
                    }
                }
            }
        }
        elsif ( $options{sources} )
        {
            print "$_\n" foreach values %$local_sources;
            print "$_\n" foreach map { urpm::blist_to_urls($_) } @$blists;
        }
        exit $urpm::postponed_code;
    }
    elsif ( $options{summary} )
    {
        foreach ( keys %{ $state->{selected} } )
        {
            foreach ( split /\|/, $_ )
            {
                my $pkg = $urpm->{depslist}[$_] or next;
                printf "%s : %s ( %s%s-%s )\n", $pkg->name, $pkg->summary,
                    ( $pkg->epoch ? $pkg->epoch . ':' : '' ), $pkg->version,
                    $pkg->release;
            }
        }
        exit $urpm::postponed_code;
    }
    elsif ( my ($get) = grep { $options{$_} } 'provides', 'requires',
        'conflicts', 'obsoletes', 'recommends' )
    {
        my @l = uniq_ { scalar $_->fullname }
        map { $urpm->{depslist}[$_] }
            map { split /\|/, $_ } keys %{ $state->{selected} };
        foreach my $pkg (@l)
        {
            if ( @l > 1 )
            {
                printf "%s: %s\n", $pkg->name, $_ foreach $pkg->$get;
            }
            else
            {
                print "$_\n" foreach $pkg->$get;
            }
        }
        exit $urpm::postponed_code;
    }
}
$urpmi_lock and $urpmi_lock->unlock;
$rpm_lock   and $rpm_lock->unlock;

#- print sub for query.
my $query_sub = sub {
    my ($id) = @_;
    $pkg_to_string->( $urpm->{depslist}[$id] );
};

my %hack_only_one;
if ( $options{complete} )
{
    foreach my $removal (
        grep {
            $state->{rejected}{$_}{removed}
                && !$state->{rejected}{$_}{obsoleted}
        }
        keys %{ $state->{rejected} || {} }
        )
    {
        print '@removing@' . $removal . "\n";
    }
    foreach my $selected ( values %{ $state->{selected} || {} } )
    {
        if (   ref($selected) eq 'HASH'
            && ref( $selected->{unsatisfied} ) eq 'ARRAY' )
        {
            foreach ( @{ $selected->{unsatisfied} } )
            {
                exists $hack_only_one{$_} and next;
                print '@unsatisfied@' . $_ . "\n";
                $hack_only_one{$_} = undef;
            }
        }
    }
}
foreach my $id (
    sort {
        eval { $urpm->{depslist}[$a]->name cmp $urpm->{depslist}[$b]->name }
            || $a <=> $b
    } $state->{selected} ? keys %{ $state->{selected} } : keys %requested
    )
{
    my $class = $state->{selected}{$id} || $requested{$id};
    if ( ref($class) eq 'ARRAY' )
    {
        foreach my $choices ( @{ $class || [] } )
        {
            exists $hack_only_one{$choices} and next;
            print join( '|', map { $query_sub->($_) } @$choices ), "\n";
            $hack_only_one{$choices} = undef;
        }
    }
    else
    {
        print join( '|', map { $query_sub->($_) } split '\|', $id ), "\n";
    }
}

exit $urpm::postponed_code;
