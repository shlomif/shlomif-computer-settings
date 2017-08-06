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
    s#\A%make_build\s+test\z#%__make test#;
    print "$_\n";
}
