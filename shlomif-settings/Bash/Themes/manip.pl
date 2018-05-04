#!/usr/bin/perl

use strict;
use warnings;

use File::Find::Object::Rule;
use IO::All;

foreach my $f ( File::Find::Object::Rule->file()->name("source.bash")->in(".") )
{
    print "$f\n";
    my $text = io->file($f)->slurp();

    my $string = q{perl ~/bin/prompt-cmd.pl "$(pwd)"};
    if ( $text =~ s{\Q$string\E}{__prompt_cmd} )
    {
        print "Modifying $f\n";
        $text =~ s{\A((?:load_common [^\n]+\n)*)}{$1load_common prompt\n};
        io->file($f)->print($text);
    }
}
