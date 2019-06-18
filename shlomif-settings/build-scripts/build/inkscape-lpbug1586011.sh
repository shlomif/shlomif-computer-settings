export LDFLAGS=' -Wl,--as-needed -Wl,--enable-new-dtags'
cmake .. -DCMAKE_INSTALL_PREFIX="$HOME/apps/to-del-inkscape" -DCMAKE_SKIP_RPATH:BOOL=ON '-DCMAKE_MODULE_LINKER_FLAGS=-Wl,--as-needed -Wl,-z,relro -Wl,-O1 -Wl,--build-id -Wl,--enable-new-dtags'
