#!/usr/bin/env bash

# For reference
# scons -Q PREFIX="$HOME/apps/latemp" install

cmake -DCMAKE_INSTALL_PREFIX="$HOME/apps/latemp" "$1"
