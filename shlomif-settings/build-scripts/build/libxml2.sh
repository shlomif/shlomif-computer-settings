#!/usr/bin/env bash
d="$HOME/apps/xml/libxml2"
./configure --prefix="$d" --with-python-install-dir="$d"
