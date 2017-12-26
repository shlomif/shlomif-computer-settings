#!/bin/bash

# The Expat License
#
# Copyright (c) 2017, Shlomi Fish
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.


if ! test -e MANIFEST ; then
    echo "Error! MANIFEST file not found." 1>&2
    exit 1
fi

sort_manifest()
{
    cat MANIFEST | (LC_ALL=C sort) | uniq > MANIFEST.new
    mv -f MANIFEST.new MANIFEST
}

# TODO :
# Lots of exactly duplicate code here - refactor.
if svn info > /dev/null 2>&1 ; then
    svn st |
        grep '^A' |
        sed 's!^A[ +]*!!' |
        perl -nle 'print if -f' \
        >> MANIFEST
    sort_manifest
elif svk info > /dev/null 2>&1 ; then
    svk diff -X -s |
        grep '^A' |
        sed 's!^A[ +]*!!' |
        perl -nle 'print if -f' \
        >> MANIFEST
    sort_manifest
elif hg st . > /dev/null 2>&1 ; then
    hg st . |
        grep '^A' |
        sed 's!^A[ +]*!!' |
        perl -nle 'print if -f' \
        >> MANIFEST
    sort_manifest
else
    echo "Error! It doesn't seem to be a legal working copy" 1>&2
    exit 1
fi
