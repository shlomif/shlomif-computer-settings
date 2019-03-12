#!/usr/bin/env bash
pip install --no-deps -r requirements/dev.txt --exists-action=w \
            --find-links https://pyrepo.addons.mozilla.org/ \
            --allow-external PIL --allow-unverified PIL \
            --download-cache=/tmp/pip-cache
