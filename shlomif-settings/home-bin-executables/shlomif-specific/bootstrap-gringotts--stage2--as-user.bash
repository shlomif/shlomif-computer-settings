#!/bin/bash
wget -c 'http://garr.dl.sourceforge.net/project/gringotts.berlios/libgringotts-1.2.1.tar.bz2' && \
    tar -xvf libgringotts-1.2.1.tar.bz2 && \
    (
        cd libgringotts-1.2.1
        bash ~/conf/trunk/shlomif-settings/build-scripts/build/libgringotts.sh && \
            make && \
            make install
    ) && \
wget -c 'http://garr.dl.sourceforge.net/project/gringotts.berlios/gringotts-1.2.10.tar.gz' && \
    tar -xvf gringotts-1.2.10.tar.gz && \
    (
        cd gringotts-1.2.10
        bash ~/conf/trunk/shlomif-settings/build-scripts/build/gringotts.sh && \
        make && \
        make install
    )

