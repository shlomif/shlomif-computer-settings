#!/bin/bash
kver="4.7.3"
ever="1.mga6"

kpath="kernel-userspace-headers-$kver.$ever"


path="$HOME/kernel-userspace-headers"


mkdir -p "$path"
make INSTALL_HDR_PATH="$path" headers_install_all
find "$path" -name ..install.cmd -exec rm -f {} \;
find "$path" -name .install -exec rm -f {} \;
mv "$path/include" "$path/$kpath"
(cd $path && tar -cavf ../"$kpath.tar.xz" "$kpath")
