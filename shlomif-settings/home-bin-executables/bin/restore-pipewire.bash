#! /usr/bin/env bash
#
# restore-pipewire.bash
# Copyright (C) 2022 Shlomi Fish < https://www.shlomifish.org/ >
#
# Distributed under the terms of the MIT license.
#

set -x

systemctl --user restart pipewire pipewire-pulse pipewire-media-session
