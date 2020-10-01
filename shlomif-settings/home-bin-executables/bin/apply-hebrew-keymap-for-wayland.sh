#! /bin/sh
#
# apply-hebrew-keymap-for-wayland.sh
# Copyright (C) 2020 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under the terms of the MIT / Expat license.
#

localectl set-x11-keymap \
    'us,il' \
    'pc105' \
    ",lyx" \
    "compose:ralt,grp:switch,grp:alt_shift_toggle,grp_led:scroll"  \

