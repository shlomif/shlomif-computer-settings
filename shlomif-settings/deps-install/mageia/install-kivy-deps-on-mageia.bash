#! /bin/bash
#
# install-kivy-deps.bash
# Copyright (C) 2018 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under terms of the MIT license.
#
# Taken from https://kivy.org/doc/stable/installation/installation-linux.html - thanks!

sudo dnf install \
    SDL_mixer-devel \
    SDL_ttf-devel \
    automake \
    gcc \
    gcc-c++ \
    gstreamer1.0-devel \
    gstreamer1.0-plugins-good \
    gstreamer1.0-python \
    make \
    mercurial \
    mesaglesv2-devel \
    mesakhr-devel \
    mtdev-devel \
    python-devel \
    python-pip
