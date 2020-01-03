#! /bin/bash
#
# install-gimp-git-master-build-dependencies--on-fedora.bash
# Copyright (C) 2020 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under terms of the MIT license.
#

sudo dnf -y builddep gimp
sudo dnf -y install automake gjs-devel gobject-introspection-devel libappstream-glib-devel libarchive-devel libgjs-devel luajit-devel meson
cd ~
ln -sf /usr/bin/automake-1.16 bin/automake-1.13
ln -sf /usr/bin/aclocal-1.16 bin/aclocal-1.13
