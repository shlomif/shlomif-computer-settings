#!/usr/bin/env bash
#
# bk-report.bash - prepare a bitkeeper bug report.
#
# USE AT YOUR OWN RISK!!!
#
# Copyright (C) 2020 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under the terms of the MIT license.
#

# See: https://users.bitkeeper.org/t/bk-clone-bk-bkbits-net-u-bk-dev-dev-segfaults-after-being-built-from-the-source-tarball-on-mageia-v8-x86-64/1149/8

build()
{
    (
        set -e -x

        export CPATH=/usr/include/tomcrypt
        ver='7.3.3'
        cd ~/Download/unpack/to-del
        if test -e bk-bin
        then
            chmod -R 777 bk-bin
        fi
        rm -fr bk-"$ver" bk-bin
        tar -xvf ~/Download/Arcs/bk-"$ver".src.tar.gz
        cd bk-"$ver"
        cd src
        make -j4 g
        make image
        mkdir -p "../../bk-bin"
        cp bk  "../../bk-bin/"
    ) 2>&1 | tee ~/bk-report.txt
}

use()
{
    (
        set -e -x
        export PATH="$PATH:$HOME/Download/unpack/to-del/bk-bin"
        cd ~/Download/unpack/to-del
        bk version
        if test -e bk-dev
        then
            rm -fr bk-dev
        fi
        uname -a
        # valgrind bk clone bk://bkbits.net/u/bk/dev dev
        bk clone bk://bkbits.net/u/bk/dev bk-dev
    ) 2>&1 | tee -a ~/bk-report.txt
}

