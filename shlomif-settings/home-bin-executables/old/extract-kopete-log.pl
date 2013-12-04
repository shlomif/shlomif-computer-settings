#!/usr/bin/perl

use strict;
use warnings;

use XML::LibXML;
use CGI ();

my $fn = shift(@ARGV);

my $parser = XML::LibXML->new();
my $doc = $parser->parse_file($fn);

my $msg_rs = $doc->findnodes("//msg");

my %nicks_map =
(
    "Sjors" => "sjors",
    "Shlomi Fish" => "shlomif",
);

binmode(STDOUT, ":encoding(utf8)");
while (my $e = $msg_rs->shift())
{
    my $sayer = $e->getAttribute("nick");
    my $body = $e->textContent();
    
    print qq(<saying who="$nicks_map{$sayer}">), 
        CGI::escapeHTML($body), qq{</saying>\n}
        ;
}
