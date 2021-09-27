#! /usr/bin/env bash
#
# shlomify.bash
# Copyright (C) 2021 Shlomi Fish < https://www.shlomifish.org/ >
#
# Distributed under the terms of the MIT license.
#

dnf -y builddep fortune-mod freecell-solver inkscape gimp

dnf -y install \
    'perl(YAML::XS)' \
    GraphicsMagick optipng \
    ImageMagick-devel \
    Xephyr \
    ack \
    apr-devel \
    asciidoctor \
    ccache \
    ccache htop \
    chromium \
    clang \
    clang-tools-extra \
    claws-mail \
    cpanm \
    cpanminus \
    docbook5-schemas \
    docbook5-style-xsl \
    dolphin \
    fedpkg \
    fortune-mod \
    gettext-devel \
    gmp-devel \
    gobject-introspection-devel \
    gperftools-devel \
    gtest-devel \
    hexchat \
    hexchat-devel \
    hexchat-perl \
    hexchat-python \
    inkscape gimp \
    intltool \
    java \
    kate \
    konsole \
    libappstream-glib-devel \
    libarchive-devel \
    libxslt \
    mame \
    meson \
    mpv \
    ninja-build \
    ocl-icd-devel \
    opencl-headers \
    parallel \
    perl-Math-BigInt-GMP \
    perl-Math-GMP \
    perl-Module-Format \
    perl-Text-Hunspell \
    perl-XML-LibXSLT \
    perl-local-lib \
    pocl-devel \
    postfix \
    primesieve \
    primesieve-devel \
    pysol \
    python-neovim \
    python3-attrs \
    python3-libsass \
    python3-pyside2 \
    python3-random2 \
    python3-tox \
    recode-devel \
    rubygem-rexml \
    rubygem-rspec \
    strace \
    telegram-desktop \
    tidy-devel \
    unbound \
    vala \
    vim-X11 \
    xclip \
    xorg-x11-server-Xvfb \
    xsltproc \
    zsh \
