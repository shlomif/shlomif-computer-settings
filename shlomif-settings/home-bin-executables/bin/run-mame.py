#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2026 Shlomi Fish < https://www.shlomifish.org/ >
#
# Licensed under the terms of the MIT license.

"""

"""

import argparse
import subprocess
import sys

from pathlib import Path

argv = sys.argv

parser = argparse.ArgumentParser(
    prog='PROG',
    formatter_class=argparse.ArgumentDefaultsHelpFormatter)
parser.add_argument('--name', type=str, required=True,
                    help='name fragment')
args = parser.parse_args(argv[1:])
name = args.name
EXT = ".7z"
dirr = Path.home() / 'mame' / 'roms'
found = None
for f in dirr.iterdir():
    bn = f.name
    if bn.endswith(EXT):
        raw = bn.removesuffix(EXT)
        if name in raw:
            found = raw
            break

if not found:
    raise RuntimeError()
game = "sf2ce"
game = found
cmd = ["mame", "-w", "-nomax", "-volume", "-24", game, ]
subprocess.check_call(cmd)
