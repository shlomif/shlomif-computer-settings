#! /usr/bin/env perl
#
# Short description for proc-c-funcs.pl
#
# Version 0.0.1
# Copyright (C) 2025 Shlomi Fish < https://www.shlomifish.org/ >
#
# Licensed under the terms of the MIT license.

use strict;
use warnings;
use 5.014;
use autodie;

use Carp         qw/ confess /;
use Getopt::Long qw/ GetOptions /;
use Path::Tiny   qw/ cwd path tempdir tempfile /;

sub run
{
    my $output_fn;

    my $buf  = path("syck_st.h")->slurp_utf8();
    my ($bl) = $buf =~ /((?:^st_table)(?:[^\n]+\n)+\n)/ms;
    my $s    = $-[1];
    my $e    = $+[1];
    warn qq#$s $e";#;    #" $bl;
    chomp $bl;
    my @l = split( /\n/, $bl );
    warn $l[0];

    my $outstr = "";

    for my $l (@l)
    {
        $l =~ s#\A(\w+ \*?)(?=st_)##ms
            or confess($l);
        my ($rett) = ($1);
        warn $rett;
        $l =~ s#;\z##ms
            or confess($l);
        my @f = split( /, /, $l );
        foreach my $func (@f)
        {
            if ( my ($id) = ( $func =~ m#\A(st_[a-z_]+)\(\)\z#ms ) )
            {
                warn $id;
                my @clines = path("syck_st.c")->lines_utf8;

                my $found = '';
                my $outf  = $rett . " " . $id . "(";
                my @outa;
                foreach my $cs ( keys @clines )
                {
                    my $cl = $clines[$cs];
                    if ( $cl =~ s#\A\Q${id}\E\(##ms )
                    {
                        warn qq#$id $cs#;
                        if ($found)
                        {
                            confess;
                        }
                        ++$found;
                        $cl =~ s#\)\n\z##ms or confess;
                        my @args  = split /,\s*/, $cl;
                        my $csarg = $cs;
                        foreach my $arg (@args)
                        {
                            if ( $arg =~ /\A[a-z_]+\z/ms )
                            {
                                my $clarg = $clines[ ++$csarg ];
                                $clarg =~
/\A\s+(\w[\w\s\*]+) (\**)(\Q${arg}\E|\(\*\Q${arg}\E\)\([^\n]*\));\n\z/
                                    or confess;
                                my ( $argtype, $aster, $name ) = ( $1, $2, $3 );
                                push @outa, "$argtype $aster $name";
                            }
                            else
                            {
                                confess;
                            }
                        }
                    }

                }
                $outf   .= join( ", ", @outa ) . ");\n";
                $outstr .= $outf;
            }
            else
            {
                confess("Cannot match func $func");
            }
        }
    }
    say $outstr;
    substr( $buf, $s, $e - $s, $outstr );
    path("syck_st.h")->spew_utf8($buf);
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
