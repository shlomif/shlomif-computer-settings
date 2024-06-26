# Copyright (c) 2024 Shlomi Fish ( https://www.shlomifish.org/ )
# Author: Shlomi Fish ( https://www.shlomifish.org/ )
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
# the Software, and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
# FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
# IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# SPDX: MIT

set -e -x
. "$HOME/conf/build/libxml2-and-libxslt-from-git.env.bash"
rm -fr "${lxmldir}"
cd ~/Download/unpack/xml/libxml2
git clean -dxf
fedora39ver="v2.10.4"
git co "${fedora39ver}"
NOCONFIGURE=1 ./autogen.sh
bash -x ~/conf/build/libxml2.sh
make
make check
make install
cd ~/Download/unpack/xml/libxslt/libxslt/
git clean -dxf
xslt_fedora39ver="v1.1.38"
git co "${xslt_fedora39ver}"
NOCONFIGURE=1 ./autogen.sh
bash -x ~/conf/build/libxml2.sh
make
make check
make install
