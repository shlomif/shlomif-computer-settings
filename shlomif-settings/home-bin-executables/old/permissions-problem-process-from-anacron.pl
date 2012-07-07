#!/usr/bin/perl

use strict;
use warnings;

LINES:
while (my $l = <>)
{
    chomp($l);

    if (my ($path, $perms) = $l =~ m{\AWARNING: Wrong permissions of (/.*?): should be (\d+)\z})
    {
        print "PATH = <$path> ; PERMS = <$perms>\n";
        chmod(oct($perms), $path);
        next LINES;
    }

    if (my ($path, $owner) = $l =~ m{\AWARNING: Wrong owner of (/.*?): should be (\S+)\z})
    {
        print "PATH = <$path> ; OWN = <$owner>\n";
        system("chown", $owner, $path);
        next LINES;
    }

    if (my ($path, $group) = $l =~ m{\AWARNING: Wrong group of (/.*?): should be (\S+)\z})
    {
        print "PATH = <$path> ; GROUP = <$group>\n";
        system("chgrp", $group, $path);
        next LINES;
    }
    
}
