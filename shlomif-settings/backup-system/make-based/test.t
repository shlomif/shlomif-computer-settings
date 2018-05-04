#!/usr/bin/perl

# The Expat License
#
# Copyright (c) 2018, Shlomi Fish
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

use strict;
use warnings;

use Test::More tests => 5;

use POSIX;

# TEST
is(
    scalar(`make -f backup.mak STAMP.pr`),
    POSIX::strftime( "%Y-%m-%d\n", localtime() ),
    "Checking for STAMP",
);

# TEST
is(
    scalar(`make -f backup.mak YS.pr`),
    POSIX::strftime( "%Y/%Y-%m-%d\n", localtime() ),
    "Checking for YS - year stamp",
);

# TEST
is(
    scalar(`make -f backup.mak BACKUP_DIR.pr`),
    POSIX::strftime(
        "$ENV{HOME}/Backup/Backup/%Y/%Y-%m-%d/disk-fs\n",
        localtime()
    ),
    "Checking for BACKUP_DIR",
);

# TEST
is(
    scalar(`make -f backup.mak EXTRA_DATA_DIR.pr`),
    POSIX::strftime(
        "$ENV{HOME}/Backup/extra-data/%Y/%Y-%m-%d/disk-fs\n",
        localtime()
    ),
    "Checking for BACKUP_DIR",
);

# TEST
like(
    scalar(`make -f backup.mak OWN_PHOTOS_ARC.pr`),
    qr/\.tar\n\z/, "Checking for tar suffix",
);
