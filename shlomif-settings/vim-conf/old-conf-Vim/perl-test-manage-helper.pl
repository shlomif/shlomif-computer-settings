#!/usr/bin/env perl

use strict;
use warnings;

use Test::Count::Filter ();
use Getopt::Long        qw/ GetOptions /;

my $filetype = "perl";
GetOptions( 'ft=s' => \$filetype ) or $!;

my %params = (
    'lisp' => {
        assert_prefix_regex => qr{; TEST},
        plan_prefix_regex   => qr{\(plan\s+},
    },
    'c' => {
        assert_prefix_regex => qr{/[/\*]\s+TEST},
        plan_prefix_regex   => qr{\s*plan_tests\s*\(\s*},
    },
    'python' => {
        plan_prefix_regex => qr{plan\s*\(\s*},
    },
);

my %aliases = (
    'arc'    => "lisp",
    'scheme' => "lisp",
    'cpp'    => "c",
);

$filetype = exists( $aliases{$filetype} ) ? $aliases{$filetype} : $filetype;
my $ft_params = exists( $params{$filetype} ) ? $params{$filetype} : +{};

my $filter = Test::Count::Filter->new( { %{$ft_params}, } );

$filter->process();
