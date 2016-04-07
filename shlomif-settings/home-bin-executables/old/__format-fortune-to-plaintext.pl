#!/usr/bin/perl

use strict;
use warnings;

use Text::Format;
use List::Util qw(max);

my $longest_nick_len = 0;
my @messages;
while(<>)
{
    chomp;
    if (m{^[^<\*]*(<[^>]+>|\*)\t(.*)$})
    {
        my ($nick, $msg) = ($1, $2);
        push @messages,
            {'type' => "say", 'nick' => $nick, 'msg' => $msg};
        $longest_nick_len =
            max($longest_nick_len, length($nick));
    }
    elsif (m{^[^\-]* ---\t(\S+) is now known as (\S+)})
    {
        my ($old_nick, $new_nick) = ($1, $2);
        push @messages,
            {'type' => "change_nick", 'old' => $old_nick, 'new' => $new_nick};
        $longest_nick_len =
            max($longest_nick_len, length($old_nick), length($new_nick));
    }
    else
    {
       push @messages, {'type' => "raw", 'msg' => $_};
    }
}
my $formatter =
    Text::Format->new(
        {
            columns => 72-1-2-$longest_nick_len,
            firstIndent => 0,
            leftMargin => 0,
        }
    );

for my $m (@messages)
{
    if ($m->{'type'} eq "say")
    {
        my @lines = ($formatter->format([$m->{'msg'}]));
        print " " . sprintf("%${longest_nick_len}s", $m->{'nick'}) .
            "  " . $lines[0];
        print map { (" " x (1+2+$longest_nick_len)) . $_ }
            @lines[1..$#lines];
    }
    elsif ($m->{'type'} eq "raw")
    {
        print $m->{'msg'}, "\n";
    }
    elsif ($m->{'type'} eq "change_nick")
    {
        print " " x ($longest_nick_len+3) .
            $m->{'old'} ." is now known as " . $m->{'new'} . "\n";
    }
}
