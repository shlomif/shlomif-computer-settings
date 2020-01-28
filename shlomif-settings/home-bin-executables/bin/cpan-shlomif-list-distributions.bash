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

db="cpandb.sql"
cpan_path="$HOME"/Download/Arcs/Perl/minicpan/
if ! test -e "$db"
then
    cpandb --CPAN "$cpan_path" --setup
fi

_list()
{
cat <<'SQL' | sqlite3 "$db"
SELECT dists.dist_name, dists.dist_vers
FROM auths, dists
WHERE dists.auth_id = auths.auth_id AND auths.cpanid = 'SHLOMIF'
ORDER BY dists.dist_name
SQL
}


_list | (while IFS='|' read dist ver
do
    # echo "dist=$dist ver=$ver"
    dv="$dist"-"$ver"
    arc="$cpan_path"/authors/id/S/SH/SHLOMIF/"$dv".tar.gz
    unpack_dir="$HOME/tmp/shlomif-cpan-unpack"
    mkdir -p "$unpack_dir"
    pushd "$unpack_dir"
    tar -xf "$arc"
    find "$dv/lib" -name '*.pm' | xargs perl -0777 -n -E 'my ($v, $n); if (/^=head1[\t ]*VERSION/ms) { $v = $-[0]; } if (/^=head1[\t ]*NAME/ms) { $n = $-[0]; } say $ARGV if ((defined $n ) && (defined $v) && $v <= $n)'
    popd
    rm -fr "$unpack_dir"
done) 2>/dev/null | grep -E '\.pm$'
