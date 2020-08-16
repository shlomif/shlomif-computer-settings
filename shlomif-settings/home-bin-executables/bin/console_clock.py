#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2020 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under the terms of the MIT license.
"""
A constantly updating wallclock time clock for the command line / terminal /
console. "python3 console_clock.py" or "pypy3 console_clock.py" should
be able to execute it.

Prior and open source art:

* https://github.com/trehn/termdown - countdown, timer and stop watch in your
terminal ( python / PyPI / GPL3 ). Hint: try "termdown -z --no-figlet"

* https://metacpan.org/pod/distribution/App-stopw/script/stopw -
stopwatch and timer (perl 5 / CPAN / Same license as perl)

* https://www.shlomifish.org/open-source/projects/countdown/ - displays a
countdown up to a given time / for a given duration (perl 5 / CPAN / MITL)


"""


from time import asctime, sleep


def main():
    try:
        while True:
            s = asctime()
            print("\r{:50}".format(s), end='', flush=True,)
            sleep(0.2)
    except KeyboardInterrupt:
        print("")


if __name__ == '__main__':
    main()
