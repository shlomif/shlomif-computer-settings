#! /bin/bash
#
# fasd.bash
# Copyright (C) 2018 shlomif <shlomif@cpan.org>
#
# Distributed under terms of the MIT license.
#
if test \( -e /etc/fedora-release \) -o \( -e /etc/centos-release \)
then
    true  # Do nothing
else
    eval "$(fasd --init auto)"
fi
