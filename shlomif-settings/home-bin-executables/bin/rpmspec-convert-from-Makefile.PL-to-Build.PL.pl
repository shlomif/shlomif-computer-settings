#!/usr/bin/perl

use strict;
use warnings;

while (<>)
{
    chomp;
    s#\A\Q%{__perl} Makefile.PL INSTALLDIRS=vendor\E\s*\z#%{__perl} Build.PL --installdirs=vendor#
        or
    s#\A(?:(?:%make(?:_build)?)|(?:%\{make(?:_build)?\}))((?: test)?)\s*\z#./Build$1#
        or
    s#\A(?:(?:%(?:make_install|makeinstall_std))|(?:%\{(?:make_install|makeinstall_std)\}))\s*\z#./Build install --destdir=%buildroot#
        ;
    print "$_\n";
}
