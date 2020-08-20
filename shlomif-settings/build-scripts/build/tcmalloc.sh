export CC=`which clang` CXX=`which clang++` CFLAGS="-O3 -march=native"
./configure --prefix="$HOME/apps/tcmalloc"
