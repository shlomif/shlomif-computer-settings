#!/bin/bash
b='/opt/llvm'
export LD='/usr/bin/ld.gold'
export PATH="$b/bin:$PATH"
export PKG_CONFIG_PATH="$b/lib64/pkgconfig:$b/lib/pkgconfig:$PKG_CONFIG_PATH"
cmake -DCMAKE_BUILD_TYPE="release" -DCMAKE_INSTALL_PREFIX="$b" -DLLVM_BINUTILS_INCDIR=/usr/lib/gcc/x86_64-mageia-linux-gnu/5.4.0/plugin/include/ "$@"
