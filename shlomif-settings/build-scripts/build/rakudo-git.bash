#!/bin/bash

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

set -x
rak_p="$HOME/apps/perl6-rakudo"
export PATH="$rak_p/bin:$PATH"
export PKG_CONFIG_PATH="$rak_p/lib/pkgconfig"

_check()
{
    if test -n "$SKIP_CHECK" ; then
        true
    else
        make check
    fi
}

rak_git_build()
{
    local git_co="$1"
    shift
    local url="$1"
    shift
    local prefix="$1"
    shift
    local branch="${1:-master}"
    shift
    local tag="${1:-false}"
    shift

    if ! test -e "$git_co" ; then
        mkdir -p "$(dirname "$git_co")"
        git clone "$url" "$git_co"
    fi
    ( cd "$git_co" && git checkout "$branch" && ($tag || git pull origin "$branch") && perl Configure.pl --gen-moar --gen-nqp --backends=moar --prefix="$prefix" && make && _check && make install ) || { echo failed ; exit -1 ; }
}

rak_git_build "$HOME/Download/unpack/perl/p6/rakudo-git-master/rakudo" https://github.com/rakudo/rakudo "$rak_p"

printf '\n== Success ==\n\n'
