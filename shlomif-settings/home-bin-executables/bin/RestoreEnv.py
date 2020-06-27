#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2020 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under the MIT license.

"""

"""

import fcntl
import json
import os
import sys
from pathlib import Path


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
        os.makedirs(dirname, exist_ok=True)
        os.makedirs(dirname+"/envs", exist_ok=True)

        lockfile = Path(dirname) / 'log.lock'
        next_id_fn = Path(dirname) / 'next-id.txt'
        next_id = 1
        lockfile.touch()
        with open(lockfile, 'a') as f:
            fcntl.flock(f, fcntl.LOCK_EX)
            try:
                with open(next_id_fn, 'rt') as ifp:
                    next_id = int(ifp.read())
            except FileNotFoundError:
                pass
            with open(next_id_fn, 'wt') as ofp:
                ofp.write(str(next_id + 1))
            fcntl.flock(f, fcntl.LOCK_UN)

        return self.save(dirname + "/envs/" + str(next_id) + ".env.json")
