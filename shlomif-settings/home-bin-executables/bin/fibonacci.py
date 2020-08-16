#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2019 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under the terms of the MIT license.


def fib():
    x, y = 0, 1
    while True:
        yield x
        x, y = y, x+y


for x in fib():
    print(x)
