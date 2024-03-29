# Copyright (c) 2020 Shlomi Fish ( https://www.shlomifish.org/ )
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

an()
{
     eval "analyze-du $(perl -E 'use Path::Tiny qw/ cwd /; say "-p \"".(cwd()=~s#\A\Q$ENV{HOME}\E/?##msr)."\""') $@"
}

i()
{
    local subdir="$(perl -E 'say `pwd` =~ s/\n\z//r =~ s#\A$ENV{HOME}/##r')"
    an -p "$subdir" | S="$subdir" perl -lpE 's#\t\K\Q$ENV{S}\E/##'
}

ah()
{
    du -ah "${1:-.}" | sort -h
}

du__summary_h()
{
    local dir="$1"
    if test -n "$dir"
    then
        du -sh "$dir"/*
    else
        du -sh *
    fi
}

-s()
{
    du__summary_h "$@"
}

shs()
{
    local dir="$1"
    du__summary_h "$dir" | sort -h
}

h()
{
    FACTOR='1024' ~/conf/trunk/shlomif-settings/home-bin-executables/bin/add-num-suffixes.pl
}
