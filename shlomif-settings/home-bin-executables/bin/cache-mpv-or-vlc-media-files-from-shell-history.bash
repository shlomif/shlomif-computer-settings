#!/usr/bin/env bash
#
# cache-mpv-or-vlc-media-files-from-shell-history.bash
# Copyright (C) 2019 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under the terms of the MIT license.
#


set -e -x
cachedir=~/Download/Video/media-cache

if ! test -e "$cachedir"
then
    mkdir -p "$cachedir"
fi
cat | perl -lanE 'say grep { m%^/% } @F if $F[1] =~ /\A(?:vlc|mpv)\z/'

