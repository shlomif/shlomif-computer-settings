#!/usr/bin/env bash
#
# install-vnu-validator.bash
# Copyright (C) 2019 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under the terms of the MIT license.
#

set -e -x
base="$HOME/Download/unpack/net/www/"
mkdir -p "$base"
cd "$base"
if ! test -d "validator"
then
    git clone 'https://github.com/validator/validator'
fi
cd "validator"
export JAVA_HOME="/usr"
python3 ./checker.py all
python3 ./checker.py jar
