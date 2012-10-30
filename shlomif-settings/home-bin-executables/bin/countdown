#!/usr/bin/perl

use strict;
use warnings;

use Time::HiRes qw(sleep time);
use POSIX qw();
use IO::Handle;

my $delay = shift(@ARGV);

STDOUT->autoflush(1);
{
    my $start = time();
    my $end = $start + $delay;

    my $last_printed;
    while ((my $t = time()) < $end)
    {
        my $new_to_print = POSIX::floor($end - $t);
        # print "$new_to_print\n";
        if (!defined($last_printed) or $new_to_print != $last_printed)
        {
            $last_printed = $new_to_print;
            print "Remaining $new_to_print/$delay", ' ' x 40, "\r";
        }
        sleep(0.1);
    }
}
