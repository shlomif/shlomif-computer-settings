#!/bin/bash
set -x
gegl_p="$HOME/apps/graphics/gegl"
babl_p="$HOME/apps/graphics/babl"
mypaint_p="$HOME/apps/graphics/libmypaint"
export PATH="$gegl_p/bin:$PATH"
export PKG_CONFIG_PATH="$gegl_p/lib/pkgconfig:$mypaint_p/lib/pkgconfig:$mypaint_p/share/pkgconfig:$babl_p/lib/pkgconfig:$PKG_CONFIG_PATH"

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

    if ! test -e "$git_co" ; then
        mkdir -p "$(dirname "$git_co")"
        git clone "$url" "$git_co"
    fi
    ( cd "$git_co" && git checkout "$branch" && git s origin "$branch" &&  NOCONFIGURE=1 ./autogen.sh && ./configure --prefix="$prefix" && make && _check && make install ) || { echo failed ; exit -1 ; }
}

autoconf_git_build "$HOME/Download/unpack/graphics/gimp/babl/git/babl" git://git.gnome.org/babl "$babl_p"
autoconf_git_build "$HOME/Download/unpack/graphics/gimp/gegl/git/gegl" git://git.gnome.org/gegl "$gegl_p"
autoconf_git_build "$HOME/Download/unpack/graphics/gimp/libmypaint/git/libmypaint" https://github.com/mypaint/libmypaint.git "$mypaint_p"
autoconf_git_build "$HOME/Download/unpack/graphics/gimp/libmypaint/git/mypaint-brushes" https://github.com/Jehan/mypaint-brushes.git "$mypaint_p" "v1.3.x"
autoconf_git_build "$HOME/Download/unpack/graphics/gimp/git/gimp" https://git.gnome.org/git "$HOME/apps/gimp-devel"

# CFLAGS="-g"  ./configure --prefix="$HOME"/apps/gimp-devel --enable-maintainer-mode
