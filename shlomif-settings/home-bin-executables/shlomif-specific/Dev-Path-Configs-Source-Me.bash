#!/usr/bin/env bash

# Copyright by Shlomi Fish, 2018 under the Expat licence
# https://opensource.org/licenses/mit-license.php

# _emsdk_path="$HOME/Download/unpack/prog/llvm-to-js/emsdk_portable"
_emsdk_path="$HOME/Download/unpack/prog/llvm-to-js/emsdk"

_oldpwd="`pwd`"
cd "${_emsdk_path}"
. "./emsdk_env.sh"
cd "${_oldpwd}"

# export PATH="${_emsdk_path}:${_emsdk_path}/bin:${_emsdk_path}/clang/fastcomp/build_master_64/bin:${_emsdk_path}/emscripten/tag-1.34.1:$HOME/apps/gnome-subtitles/bin:$HOME/apps/multimedia/mikmod/bin:$HOME/apps/multimedia/libmikmod/bin:$HOME/apps/spidermonkey-js/bin:$HOME/Download/unpack/xml/ebookmaker:$HOME/apps/vim/bin:$HOME/Download/unpack/prog/ninja/ninja:$HOME/apps/fcs-for-pysol/bin/:$PATH"
export PATH="HOME/apps/multimedia/mikmod/bin:$HOME/apps/multimedia/libmikmod/bin:$HOME/apps/spidermonkey-js/bin:$HOME/Download/unpack/xml/ebookmaker:$HOME/apps/vim/bin:$HOME/apps/fcs-for-pysol/bin/:$PATH"

export LD_LIBRARY_PATH="$HOME/apps/xml/libxml2/lib/"
export PKG_CONFIG_PATH="$HOME/apps/file/libgringotts/lib/pkgconfig"

export CPATH="/usr/lib64/giomm-2.4/include"

# The compilation of emscripten-fastcomp is broken and should not be set.
#
# export clang_dir=~/Download/unpack/prog/llvm-to-js/fastcomp/emscripten-fastcomp/build/Release/bin
# export CC="$clang_dir/clang" CXX="$clang_dir/clang++"
