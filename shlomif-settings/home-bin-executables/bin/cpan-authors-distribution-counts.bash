#!/usr/bin/env bash

# The Expat License
#
# Copyright (c) 2019, Shlomi Fish
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

set -x
db="cpandb.sql"
if test "$F" = 1
then
    rm -f "$db"
fi
if ! test -e "$db"
then
    cpandb --CPAN "$HOME"/Download/Arcs/Perl/minicpan/ --setup
fi
(
cat <<'SQL' | sqlite3 "$db"
SELECT cpanid, count(*) AS cnt
FROM auths, dists
WHERE dists.auth_id = auths.auth_id
GROUP BY auths.auth_id
ORDER BY cnt, cpanid;
SQL
) | perl shlomif-settings/home-bin-executables/bin/tac-n-tac.pl
