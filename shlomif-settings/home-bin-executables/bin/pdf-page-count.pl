#! /usr/bin/env perl
#
# Short description for pdf-page-count.pl
#
# Based on
# https://superuser.com/questions/403672/how-to-count-pages-in-multiple-pdf-files
# Thanks!
#
# Version 0.0.1
# Copyright (C) 2022 Shlomi Fish < https://www.shlomifish.org/ >
#
# Licensed under the terms of the MIT license.

use strict;
use warnings;
use 5.014;
use autodie;

use Carp qw/ confess /;
use Getopt::Long qw/ GetOptions /;
use Path::Tiny qw/ cwd path tempdir tempfile /;
use Docker::CLI::Wrapper::Container v0.0.4 ();

sub run
{
    my $output_fn;

    my $obj = Docker::CLI::Wrapper::Container->new(
        { container => "rinutils--deb--test-build", sys => "debian:sid", } );

    GetOptions( "output|o=s" => \$output_fn, )
        or die "errror in cmdline args: $!";

    if ( !defined($output_fn) )
    {
        # die "Output filename not specified! Use the -o|--output flag!";
    }
    foreach my $fn (@ARGV)
    {
        open my $info, "-|", "pdfinfo", "$fn";
    LINES:
        while ( my $l = <$info> )
        {
            if ( my ($num) = $l =~ /\APages:\s*([0-9]+)/ )
            {
                say qq/$fn\t$num/;
                last LINES;
            }

            # body...
        }
        eval { close($info); };
        if ( my $err = $@ )
        {
            warn $err;
        }
    }

    # $obj->do_system( { cmd => [ "git", "clone", "-b", $BRANCH, $URL, ] } );

    exit(0);
}

run();

1;

__END__

=encoding UTF-8

=head1 NAME

pdf-page-count.pl

=head1 VERSION

version v0.0.2

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2007 by Shlomi Fish.

This is free software, licensed under:

  The MIT (X11) License

=cut
