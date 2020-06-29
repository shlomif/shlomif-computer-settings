#! /usr/bin/env perl
#
# Short description for analyze.pl
#
# Author Shlomi Fish <shlomif@cpan.org>
# Copyright 2020 Shlomi Fish ( https://www.shlomifish.org/ )
# Author: Shlomi Fish ( https://www.shlomifish.org/ )
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

use strict;
use warnings;
use 5.014;
use autodie;

use Path::Tiny qw/ path tempdir tempfile cwd /;
use JSON::MaybeXS qw/ decode_json /;

my %hash;

my $h = $ENV{HOME};

sub populate
{
    my ( $which, $dest, $src ) = @_;
    my $ex = -e $dest;
    if ( not $ex )
    {
        system( "rm", "-fr", $dest );
        system( "mkdir", $dest );
        foreach my $p ( path($src)->children(qr/\.env.json\z/) )
        {
            my $bn = $p->basename;
            my $d  = $dest . '/' . $bn;
            system(
"$^X -lp /home/shlomif/conf/trunk/shlomif-settings/home-bin-executables/bin/post-process-env-json.pl < $p > @{[$d]}"
            );
            my $j = decode_json( path($d)->slurp_utf8() );
            foreach
                my $cfn ( map { m#(?:/|\A)([^/]+\.(?:c|cpp))\z# ? ($1) : () }
                @{ $j->{argv} } )
            {
                push @{ $hash{$cfn}{$which} }, $bn;
            }
        }
    }
    else
    {
        foreach my $p ( path($dest)->children(qr/\.env.json\z/) )
        {
            my $bn = $p->basename;
            my $d  = $dest . '/' . $bn;
            my $j  = decode_json( path($d)->slurp_utf8() );
            foreach
                my $cfn ( map { m#(?:/|\A)([^/]+\.(?:c|cpp))\z# ? ($1) : () }
                @{ $j->{argv} } )
            {
                push @{ $hash{$cfn}{$which} }, $bn;
            }
        }
    }
    return;
}
{
    my $which = 'meson';
    my $dest  = "$h/Arcs/temp/gimpgitbuild-meson-pr";
    my $src   = "$h/Arcs/temp/gimpgitbuild-meson/temp-bin/envs";
    populate( $which, $dest, $src );
}
{
    my $which = 'autoconf';
    my $dest  = "$h/Arcs/temp/gimpgitbuild-${which}-pr";
    my $src   = "$h/Arcs/temp/gimpgitbuild-${which}/temp-bin/envs";
    populate( $which, $dest, $src );
}
use Data::Dumper qw/ Dumper/;
print Dumper( \%hash );
