#!/bin/bash

export PATH="$HOME/apps/gnome-subtitles/bin:$HOME/apps/multimedia/mikmod/bin:$HOME/apps/multimedia/libmikmod/bin:$HOME/apps/spidermonkey-js/bin:$HOME/Download/unpack/xml/ebookmaker:$HOME/apps/vim/bin:$HOME/apps/llvm/bin/:$HOME/Download/unpack/prog/llvm-to-js/emscripten:$HOME/Download/unpack/prog/ninja/ninja:$HOME/apps/fcs-for-pysol/bin/:$PATH"

export LD_LIBRARY_PATH="$HOME/apps/multimedia/libmikmod/lib"
export PKG_CONFIG_PATH="$HOME/apps/file/libgringotts/lib/pkgconfig"

# The compilation of emscripten-fastcomp is broken and should be set.
# export clang_dir=/home/shlomif/Download/unpack/prog/llvm-to-js/fastcomp/emscripten-fastcomp/build/Release/bin
# export CC="$clang_dir/clang" CXX="$clang_dir/clang++"
