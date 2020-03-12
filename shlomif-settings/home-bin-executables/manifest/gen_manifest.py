#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2018 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under terms of the MIT license.

import os
import os.path
from six import print_


def main():
    """docstring for main"""
    DIRNAME = os.path.expanduser('~/bin')
    for fn in sorted(os.listdir(DIRNAME)):
        path = DIRNAME + '/' + fn
        if os.path.islink(path):
            linkto = os.readlink(path)
            print_('Link: %s -> %s' % (fn, linkto))
        elif os.path.isdir(path):
            print_('Dir: %s' % (fn))
        else:
            print_('Plain: %s' % (fn))


main()
