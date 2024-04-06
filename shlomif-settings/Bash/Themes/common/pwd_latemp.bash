# pwd_latemp.bash
# Copyright (C) 2021 Shlomi Fish < https://www.shlomifish.org/ >
#
# Distributed under the terms of the MIT license.
#

proj_name="${proj_name:-pwd_latemp}"
PATH+=:$PWD/node_modules/.bin
PATH+=:~/apps/quadpres/bin
PATH+=:~/apps/wml-from-source/bin
export QUAD_PRES_CACHE_DIR=~/Arcs/temp/quad-pres-cache
export PERL_INLINE_DIRECTORY="${TMPDIR:-/tmp}/shlomif-hp-Inline"
export HTML_VALID_VNU_JAR=~/Download/unpack/net/www/validator/build/dist/vnu.jar
export QUAD_PRES_QUIET=1
export MAKEFLAGS="-r -j4"
MAKEFLAGS+=" -s"
load_common data_caches
load_common partests
