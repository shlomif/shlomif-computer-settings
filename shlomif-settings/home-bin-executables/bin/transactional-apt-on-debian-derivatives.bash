#!/usr/bin/env bash

# Copyright by Shlomi Fish, 2016 under the Expat licence
# https://opensource.org/licenses/mit-license.php

# This program installs a transaction of apt updates on Debian and derivatives
# (Ubuntu, Mint, etc.). It may not be the recommended way to do it so:
# USE AT YOUR OWN RISK.

apt-get -y --no-install-recommends install $(apt list --upgradable | grep -v task | tail -50 | perl -lapE 's#/.*##')
