#! /usr/bin/env perl
#
# Short description for build-wiki.pl
#
# Version 0.0.1
# Copyright (C) 2023 Shlomi Fish < https://www.shlomifish.org/ >
#
# Licensed under the terms of the MIT license.

use strict;
use warnings;
use 5.014;
use autodie;

use Carp                                   qw/ confess /;
use Getopt::Long                           qw/ GetOptions /;
use Path::Tiny                             qw/ cwd path tempdir tempfile /;
use Docker::CLI::Wrapper::Container v0.0.4 ();

sub run
{
    my $output_fn;

    my $obj = Docker::CLI::Wrapper::Container->new(
        { container => "rinutils--deb--test-build", sys => "debian:sid", } );

    if (0)
    {
        GetOptions( "output|o=s" => \$output_fn, )
            or die "errror in cmdline args: $!";

        if ( !defined($output_fn) )
        {
            die "Output filename not specified! Use the -o|--output flag!";
        }
    }

    my $dir = path("$ENV{HOME}/Download/web-sites/branchable");

    my $rend = "${dir}/rendered-shlomifishswiki.branchable.com";
    $obj->do_system(
        {
            cmd =>
                [ "ikiwiki", "${dir}/shlomifishswiki.branchable.com", $rend, ],
        }
    );

    $obj->do_system(
        {
            cmd => [ "sky", "-x", "up-r", $rend, ],
        }
    );

    exit(0);
}

run();

1;

__END__

=encoding UTF-8

=head1 NAME

XML::Grammar::Screenplay::App::FromProto

=head1 VERSION

version v0.16.0

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2007 by Shlomi Fish.

This is free software, licensed under:

  The MIT (X11) License

=cut
