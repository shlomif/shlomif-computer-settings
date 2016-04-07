make clean

  # CFLAGS="${CFLAGS:--O2 -g -pipe -Wformat -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -fstack-protector --param=ssp-buffer-size=4 -fPIC}" ; export CFLAGS ;
  # CXXFLAGS="${CXXFLAGS:--O2 -g -pipe -Wformat -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -fstack-protector --param=ssp-buffer-size=4 -fPIC}" ; export CXXFLAGS ;
  # FFLAGS="${FFLAGS:--O2 -g -pipe -Wformat -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -fstack-protector --param=ssp-buffer-size=4 -fPIC}" ; export FFLAGS ;
  # LDFLAGS="$LDFLAGS -Wl,--as-needed -Wl,--no-undefined -Wl,-z,relro -Wl,-O1 -Wl,--build-id -Wl,--enable-new-dtags"; export LDFLAGS ;
  # CONFIGURE_TOP="${CONFIGURE_TOP:-.}";
#   /usr/lib/rpm/mageia/force-as-needed-for-shared-lib-in-libtool ;
#   /usr/lib/rpm/mageia/drop-ld-no-undefined-for-shared-lib-modules-in-libtool ;
#   /usr/lib/rpm/mageia/fix-libtool-ltmain-from-overlinking ;
#   /usr/lib/rpm/mageia/fix-libtool-from-moving-options-after-libs $CONFIGURE_TOP ;
#   /usr/lib/rpm/mageia/fix-dlsearch-path-in-libtool-for-multilib $CONFIGURE_TOP lib64 ;

  # [ -f $CONFIGURE_TOP/configure.in -o -f $CONFIGURE_TOP/configure.ac ] &&
  # ./configure --build=x86_64-mageia-linux-gnu \
  ./configure \
    --prefix="$HOME/apps/pcre" \
    --disable-jit \
   	--enable-utf \


#   	--disable-static \
#   	--enable-unicode-properties \
#   	--enable-pcre8 \
#   	--enable-pcre16 \
#   	--enable-pcre32 \

make -j8 install

	# --enable-jit \
