#! /bin/bash
#
# install-kivy-deps.bash
# Copyright (C) 2018 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under terms of the MIT license.
#
# Taken from https://kivy.org/doc/stable/installation/installation-linux.html - thanks!

sudo dnf install \
    make \
    mercurial \
    automake \
    gcc \
    gcc-c++ \
    SDL_ttf-devel \
    SDL_mixer-devel \
    mesakhr-devel \
    mesaglesv2-devel \
    gstreamer1.0-plugins-good \
    gstreamer1.0-devel \
    gstreamer1.0-python \
    mtdev-devel \
    python-devel \
    python-pip
