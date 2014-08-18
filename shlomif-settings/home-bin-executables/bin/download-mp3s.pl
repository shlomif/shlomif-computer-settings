#!/usr/bin/perl

use strict;
use warnings;

use WWW::Mechanize;
use File::Basename;

my $mech = WWW::Mechanize->new();

$mech->get("http://www.royalbaronialtheatre.com/blog/here-my-explosion-soundtrack.html");

my $links = $mech->links();

foreach my $l (@{$links})
{
    if ($l->url() =~ m{\.mp3\z})
    {
        $mech->get($l, ':content_file' => (($l->URI->path_components)[-1]));
    }
}
