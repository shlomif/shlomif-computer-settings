#! /usr/bin/env bash
#
# report-opencl-bug.bash
# Copyright (C) 2021 Shlomi Fish < https://www.shlomifish.org/ >
#
# Distributed under the terms of the MIT license.
#

(
echo "On an Intel NUC with Fedora 33 x86-64, clinfo lists no devices"
echo
echo '```'
(
    set -x
    inxi -CSG
    clinfo
    lspci -vnn
    lsmod
    dmesg | grep -E "i915|drm"
    cat /proc/cmdline
    ls -lR /dev/dri
    groups
) |& cat
echo '```'
) | gvim -
