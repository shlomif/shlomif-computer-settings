#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2019 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under the terms of the MIT license.

import sys

from six import print_

i = open(sys.argv[1], "rt")
o = {}
cnt = 0
for line in i:
    pref = line[:2]
    if pref not in o:
        o[pref] = open("parts/{}.txt".format(pref), "at")
    o[pref].write(line[2:])
    cnt += 1
    if not cnt & 0xFFFF:
        print_("Reached {}".format(cnt), file=sys.stderr)
