use strict;
use warnings;

system(
    $^X,
    qw/-lp -i.bak -E /,
    's/inkex\.py/inkex\/__init__.py/ms',
    glob("$ENV{HOME}/.config/inkscape/extensions/*.inx"),
);
__END__

=head1 ABOUT

    shlomif[homepage]:$trunk$ inkscape --export-width=200 --export-type=png --export-filename="2del-out.png" src/humour/human-hacking/images/human-hacking-field-guide-logo.svg

    ** (org.inkscape.Inkscape:171687): WARNING **: 15:05:07.751: Failed to find resource file 'inkex.py'. Looked in:
            /home/shlomif/.config/inkscape/extensions/inkex.py
            /usr/share/inkscape/extensions/inkex.py

    ** (org.inkscape.Inkscape:171687): WARNING **: 15:05:07.751: Failed to find resource file 'inkex.py'. Looked in:
            /home/shlomif/.config/inkscape/extensions/inkex.py
            /usr/share/inkscape/extensions/inkex.py

    ** (org.inkscape.Inkscape:171687): WARNING **: 15:05:07.751: Failed to find resource file 'inkex.py'. Looked in:
            /home/shlomif/.config/inkscape/extensions/inkex.py
            /usr/share/inkscape/extensions/inkex.py

=head1 COPYRIGHT & LICENSE

Copyright 2022 by Shlomi Fish

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
