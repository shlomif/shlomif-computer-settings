#!/usr/bin/env bash

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
gegl_p="$HOME/apps/graphics/gegl"
babl_p="$HOME/apps/graphics/babl"
mypaint_p="$HOME/apps/graphics/libmypaint"
export PATH="$gegl_p/bin:$PATH"
export PKG_CONFIG_PATH="$gegl_p/lib/pkgconfig:$mypaint_p/lib/pkgconfig:$mypaint_p/share/pkgconfig:$babl_p/lib/pkgconfig:$PKG_CONFIG_PATH"
export XDG_DATA_DIRS="$gegl_p/share:$mypaint_p/share:$mypaint_p/share/pkgconfig:$babl_p/share:$XDG_DATA_DIRS"

_check()
{
    if test -n "$SKIP_CHECK" ; then
        true
    else
        make check
    fi
}

autoconf_git_build()
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
    ( cd "$git_co" && git checkout "$branch" && ($tag || git s origin "$branch") && NOCONFIGURE=1 ./autogen.sh && ./configure --prefix="$prefix" && make && _check && make install ) || { echo failed ; exit -1 ; }
}

meson_git_build()
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
    ( cd "$git_co" && git checkout "$branch" && ($tag || git s origin "$branch") && mkdir -p "build" && cd build && meson --prefix="$prefix" .. && ninja -j1 && ninja -j1 test && ninja -j1 install ) || { echo failed ; exit -1 ; }
}

GNOME_GIT='https://gitlab.gnome.org/GNOME'
meson_git_build "$HOME/Download/unpack/graphics/gimp/babl/git/babl" "$GNOME_GIT"/babl "$babl_p"
autoconf_git_build "$HOME/Download/unpack/graphics/gimp/gegl/git/gegl" "$GNOME_GIT"/gegl "$gegl_p"
autoconf_git_build "$HOME/Download/unpack/graphics/gimp/libmypaint/git/libmypaint" https://github.com/mypaint/libmypaint.git "$mypaint_p" "v1.3.0" true
autoconf_git_build "$HOME/Download/unpack/graphics/gimp/libmypaint/git/mypaint-brushes" https://github.com/Jehan/mypaint-brushes.git "$mypaint_p" "v1.3.x"
autoconf_git_build "$HOME/Download/unpack/graphics/gimp/git/gimp" "$GNOME_GIT"/gimp "$HOME/apps/gimp-devel"

printf '\n== Success ==\n\n'
# CFLAGS="-g"  ./configure --prefix="$HOME"/apps/gimp-devel --enable-maintainer-mode
