#! /usr/bin/env bash
#
# dpkg-rc-purge.bash
# Copyright (C) 2021 Shlomi Fish < https://www.shlomifish.org/ >
#
# Distributed under the terms of the MIT license.
#


dpkg --list | perl -lanE 'print $F[1] if /\Arc/' | xargs dpkg --purge
