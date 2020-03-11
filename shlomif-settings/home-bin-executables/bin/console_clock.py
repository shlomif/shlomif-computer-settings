#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2020 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under terms of the MIT license.


from time import asctime, sleep


def main():
    while True:
        s = asctime()
        print("\r{:50}".format(s), end='', flush=True,)
        sleep(0.2)


main()
