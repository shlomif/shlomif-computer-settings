#!/usr/bin/env bash

perl Build.PL
./Build
./Build test
./Build install prefix="$HOME/apps/docbook-builder/"
