#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2024 Shlomi Fish < https://www.shlomifish.org/ >
#
# Licensed under the terms of the MIT license.

"""

"""

import json
import re

with open("Desktop/bookmarks-2024-10-04.json", "rt") as fh:
    j = json.load(fh)

urls = {}


def recurse(stack):
    if 'uri' in stack[-1]:
        url = stack[-1]['uri']
        url = re.sub("\\Ahttp:", "https:", url)
        if url not in urls:
            urls[url] = {'instances': [], }
        urls[url]['instances'].append(stack)
    if 'children' in stack[-1]:
        for child in stack[-1]['children']:
            recurse(stack + [child])


recurse([j])

for k in sorted(urls.keys()):
    v = urls[k]
    instances = v['instances']
    if len(instances) > 1:
        print(k)
        for inst in instances:
            print("\t", [x['title'] for x in inst])
        print('')
