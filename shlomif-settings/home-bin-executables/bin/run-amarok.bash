#!/bin/bash
d=/opt/amarok
export LD_LIBRARY_PATH="$HOME/apps/qt-4.8.x/lib:$d/lib64"
export KDEDIRS="$d"
"$d"/bin/amarok
