# Copyright (c) 2020 Shlomi Fish ( https://www.shlomifish.org/ )
# Author: Shlomi Fish ( https://www.shlomifish.org/ )
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
# the Software, and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
# FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
# IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

use_meson="$1"
shift
if test "$use_meson" = 1
then
    backup_dir="$HOME/Arcs/temp/gimpgitbuild-meson"
    log_fn=$HOME/gimpgitbuild-meson.txt
    processed="$HOME/me.txt"
else
    log_fn=$HOME/gimpgitbuild-autoconf.txt
    backup_dir="$HOME/Arcs/temp/gimpgitbuild-autoconf"
    processed="$HOME/ac.txt"
fi

(
    gimpgitbuild cleanbuild
    rm -f ~/temp-bin/envs/* ~/temp-bin/next-id.txt
    set -x
    export SHELL=/bin/sh PYTHONPATH="$HOME"/conf/trunk/shlomif-settings/home-bin-executables/bin CC="$HOME"/temp-bin/gcc CXX="$HOME"/temp-bin/g++ GIMPGITBUILD__BUILD_GIMP_USING_MESON=0 GIMPGITBUILD__PAR_JOBS_FLAGS='-j1'
    $CXX
    gimpgitbuild build
    notifier notify -m "gimp build"
) |& tee "$log_fn"
rm -fr "$backup_dir"
mkdir -p "$backup_dir"
cp -a "$log_fn" ~/temp-bin "$backup_dir"

f()
{
    d="$1" ; shift;
    ( cd "$d" && ls *.json | sort -n | xargs cat )
}
f ~/temp-bin/envs > "$processed"
perl -lp -i ~/conf/trunk/shlomif-settings/home-bin-executables/bin/post-process-env-json.pl "$processed"
notifier notify -m "gimp build"
