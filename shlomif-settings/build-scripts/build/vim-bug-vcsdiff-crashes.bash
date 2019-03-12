#!/usr/bin/env bash

# With these :VCSDiff aborts the program
# RPM_OPT_FLAGS="-O2 -g -pipe -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fomit-frame-pointer -march=i586 -mtune=generic -fasynchronous-unwind-tables"

# With these :VCSDiff aborts the program
# RPM_OPT_FLAGS="-O2 -g -pipe -Wp,-D_FORTIFY_SOURCE=2"

# With these :VCSDiff aborts the program
# RPM_OPT_FLAGS="-O2 -g -Wp,-D_FORTIFY_SOURCE=2"

# Doesn't cause a crash.
# RPM_OPT_FLAGS="-O2"

# Doesn't cause a crash.
# RPM_OPT_FLAGS="-Wp,-D_FORTIFY_SOURCE=2"

# Causes a crash.
# RPM_OPT_FLAGS="-O2 -g -Wp,-D_FORTIFY_SOURCE=2"

# Causes a crash.
# RPM_OPT_FLAGS="-O2 -Wp,-D_FORTIFY_SOURCE=2"

# Causes a crash.
# RPM_OPT_FLAGS="-O1 -Wp,-D_FORTIFY_SOURCE=2"

# Trying to see where it happens in the source
RPM_OPT_FLAGS="-O1 -g -Wp,-D_FORTIFY_SOURCE=2"

CFLAGS="$RPM_OPT_FLAGS" CXXFLAGS="$RPM_OPT_FLAGS" \
./configure --prefix=$HOME/apps/vim
