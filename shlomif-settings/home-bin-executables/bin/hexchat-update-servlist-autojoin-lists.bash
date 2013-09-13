#!/bin/bash
#
# The "J=" syntax for autojoin channels was changed in HexChat's servlist.conf
# starting from version 2.9.6. This script updates it - run it in the same
# directory of "servlist.conf" (normally ~/.config/hexchat/ ).
#
# Copyright by Shlomi Fish, 2013
# Licensed under the MIT/X11 Licence.

perl -pi.bak -l -e 'if (my ($l) = /\AJ=(.*)/) { $_ = join("\n", map { "J=$_" } split",",$l); }' servlist.conf
