#!/usr/bin/env bash

# Dependencies:
#
# * https://github.com/shlomif/shlomif-computer-settings/blob/master/shlomif-settings/home-bin-executables/bin/extract-mageia-updates-cpan-updates
#
# * https://metacpan.org/pod/distribution/App-Magpie/bin/magpie
#
# also see the mageia patches - http://madb.mageia.org/package/show/name/magpie/release/cauldron
#
# * https://metacpan.org/pod/distribution/CPAN-Mini/bin/minicpan
#
# * https://metacpan.org/pod/distribution/App-Notifier-Client/bin/notifier

list_fn="$HOME/mageia-perl-magpie-modules-list.txt"

if ! test -e "$list_fn"
then
    extract-mageia-updates-cpan-updates http://check.mageia.org/cauldron/shlomif/updates.html > "$list_fn"
fi

minicpan

update_multi()
{
    while read mod
    do
        (
            echo "$mod"
            magpie checkout "$mod" && \
                cd "$mod" && \
                magpie update && \
                cd .. && \
                rm -fr "$mod"
        ) || break
    done
    notifier notify -m 'mu update'
}

my_update()
{
    update_multi < "$list_fn"
}

my_update

# The Expat License
#
# Copyright (c) 2018, Shlomi Fish
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
