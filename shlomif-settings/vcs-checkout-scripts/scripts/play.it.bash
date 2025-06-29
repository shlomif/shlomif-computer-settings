#! /usr/bin/env bash
#
# play.it.bash
# Copyright (C) 2025 Shlomi Fish < https://www.shlomifish.org/ >
#
# Distributed under the terms of the MIT license.
#

# checkout https://git.dotslashplay.it/play.it/about/ . This was hard to
# find in ddg / Google ; also see https://packages.debian.org/sid/play.it
(
    set -e -x
    git clone --branch main --depth 1 https://git.dotslashplay.it/play.it play.it.git
    cd play.it.git
)
