#! /usr/bin/env bash
#
# update-all-the-things.bash
# Copyright (C) 2021 Shlomi Fish < https://www.shlomifish.org/ >
#
# Distributed under the terms of the MIT license.
#

(
    set -e -x
    (
        -t nvim
        unset MAKEFLAGS
        update_all
    )
    minicpan
    (
        -t perl/6
        update_all
    )
)
