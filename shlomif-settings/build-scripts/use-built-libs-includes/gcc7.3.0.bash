# gcc7.3.0.bash
# Copyright (C) 2018 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under terms of the MIT license.
#

d=~/apps/prog/gcc-7.3.0/
db="$d/bin"
PATH="$db:$PATH"
export CC="$db/gcc" CXX="$db/g++"
