# SOURCE ME.
export CC=gcc CXX=g++
../configure --enable-optimized \
    --disable-assertions --enable-targets=host,js \
    --with-gcc-toolchain=/usr/lib/gcc/x86_64-mageia-linux-gnu/4.8.2
