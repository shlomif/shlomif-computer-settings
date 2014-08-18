#!/bin/bash
export CXXFLAGS="-ggdb -O0"
./configure --prefix="$HOME/apps/qt-4.8.x" -opensource -confirm-license -debug
