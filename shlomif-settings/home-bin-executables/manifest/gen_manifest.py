#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2018 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under terms of the MIT license.

"""

"""

import os
from six import print_


def main():
    """docstring for main"""
    DIRNAME = '/home/shlomif/bin'
    for fn in sorted(os.listdir(DIRNAME)):
        print_(fn)


main()
