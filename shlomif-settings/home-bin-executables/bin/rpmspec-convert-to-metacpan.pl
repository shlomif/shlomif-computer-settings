#!/usr/bin/perl

use strict;
use warnings;

while (<>)
{
    chomp;
    if (/\AUrl\s*:/i)
    {
        s#http://search.cpan.org/dist/#http://metacpan.org/release/#;
    }
    s#\A%makeinstall_std *\z#%make_install#;
    s#\A%make\b#%make_build#;
    print "$_\n";
}
