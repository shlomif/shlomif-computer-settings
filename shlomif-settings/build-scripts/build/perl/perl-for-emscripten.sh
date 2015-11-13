#!/bin/sh
rm -f config.sh Policy.sh
# -flto does not work properly in gcc-4.9.x without -ffat-lto-objects
sh Configure -de -Dprefix=/usr -Doptimize='-g' -Dusedevel -Uuse64bitint -Uuse64bitall -Ud_sem -Di_fcntl -Ud_sigsetjmp
perl -i -lape 's#^#// # if m{^#define LIBM_LIB_VERSION} ; s/\blong\b/long long/ if m{^\s*#\s*define\s+(?:[IU]64TYPE|Quad_t|Uquad_t)}; s/^(\s*#\s*define\s+QUADKIND\s+)2/${1}3/; s/8/4/ if m{^\s*#\s*define\s+[IU]VSIZE};s/^(\s*#\s*define\s+NV_PRESERVES_UV_BITS\s+)\d+/${1}32/' config.h
