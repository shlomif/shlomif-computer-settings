#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2020 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under the MIT license.

"""

"""

import json
import os
import re
import sys


class SaveEnv:
    def __init__(self, exepath):
        """docstring for __init__"""
        self.exepath = exepath
        return

    def save(self, fn):
        """docstring for save"""
        with open(fn, 'wt') as fp:
            json.dump(
                {
                    'argv': sys.argv,
                    'cwd': os.getcwd(),
                    'env': dict(os.environ),
                },
                fp, indent=(" "*4), sort_keys=True)
        exepath = self.exepath
        os.execv(exepath, [exepath]+sys.argv[1:])

    def dirsave(self, dirname):
        maxidx = 0
        for fn in os.listdir(dirname):
            m = re.match('^([0-9]+)\\.env\\.json$', fn)
            if m:
                maxidx = max([maxidx, int(m.group(1))])
        return self.save(dirname + "/" + str(maxidx+1)+".env.json")
