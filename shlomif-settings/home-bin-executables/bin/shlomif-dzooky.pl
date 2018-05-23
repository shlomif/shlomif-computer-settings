#! /usr/bin/env perl
#
# Short description for cpan-keywords-to-dzil.pl
#
# Author shlomif <shlomif@cpan.org>
# Version 0.1
# Copyright (C) 2018 shlomif <shlomif@cpan.org>
# Modified On 2018-05-19 18:57
# Created  2018-05-19 18:57
#
use strict;
use warnings;

use IO::All qw/ io /;

system('dzooky dist --bundle SHLOMIF');

if (io('Build.PL')->all =~ m%keywords%)
{
    system("perl -0777 -lnE 'say \$1 if m%.*keywords.*?\\[(.*?)\\]%ms' < Build.PL | perl ~/conf/trunk/shlomif-settings/home-bin-executables/bin/cpan-keywords-to-dzil.pl >> dist.ini");
}

my $f = io('dist.ini');
my $t = $f->all;
$t =~ s#repository.url#repository_url#g;
$t =~ s#(^name = (\S+)\n.*\[\@SHLOMIF\]\n)#$1dist = $2\n#ms;
$f->print($t);

system('cp /home/shlomif/progs/perl/cpan/git/Module-Format/Module-Format/{.tidyallrc,MANIFEST.SKIP,weaver.ini} .');
__END__

=head1 COPYRIGHT & LICENSE

Copyright 2018 by Shlomi Fish

This program is distributed under the MIT / Expat License:
L<http://www.opensource.org/licenses/mit-license.php>

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

=cut
