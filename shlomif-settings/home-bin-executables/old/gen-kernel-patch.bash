#!/bin/bash
find linux-3.2/ -name '*.orig' | (while read T ; do diff -u "$T" "${T%%.orig}" ; done)
