#! /bin/sh
#
# validator-vnu-w3c-html.sh
# Copyright (C) 2020 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under the MIT license.
#
set -e -x
export JAVA_HOME=/usr
python3 checker.py build
# python3 checker.py jar



