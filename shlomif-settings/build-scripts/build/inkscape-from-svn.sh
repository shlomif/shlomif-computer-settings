#!/bin/bash
# --with-python - remming out because of 
# http://sourceforge.net/tracker/index.php?func=detail&aid=1629444&group_id=93438&atid=604306
./configure --prefix=$HOME/apps/graphics/inkscape-svn \
    --with-gnome-vfs --with-perl \
    --with-xft \
    --enable-inkboard \
    --with-python \


