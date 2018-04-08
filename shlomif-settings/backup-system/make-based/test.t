#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 5;

use POSIX;

# TEST
is (scalar(`make -f backup.mak STAMP.pr`),
    POSIX::strftime("%Y-%m-%d\n", localtime()),
    "Checking for STAMP",
);

# TEST
is (scalar(`make -f backup.mak YS.pr`),
    POSIX::strftime("%Y/%Y-%m-%d\n", localtime()),
    "Checking for YS - year stamp",
);

# TEST
is (scalar(`make -f backup.mak BACKUP_DIR.pr`),
    POSIX::strftime("$ENV{HOME}/Backup/Backup/%Y/%Y-%m-%d/disk-fs\n", localtime()),
    "Checking for BACKUP_DIR",
);

# TEST
is (scalar(`make -f backup.mak EXTRA_DATA_DIR.pr`),
    POSIX::strftime("$ENV{HOME}/Backup/extra-data/%Y/%Y-%m-%d/disk-fs\n", localtime()),
    "Checking for BACKUP_DIR",
);

# TEST
like (scalar(`make -f backup.mak OWN_PHOTOS_ARC.pr`),
    qr/\.tar\n\z/,
    "Checking for tar suffix",
);
