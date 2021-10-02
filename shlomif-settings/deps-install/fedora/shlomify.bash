#! /usr/bin/env bash
#
# shlomify.bash
# Copyright (C) 2021 Shlomi Fish < https://www.shlomifish.org/ >
#
# Distributed under the terms of the MIT license.
#

dnf -y builddep fortune-mod freecell-solver inkscape gimp

    # 'perl(Math::Random::MT)' \

dnf -y install \
    'perl(YAML::XS)' \
    GraphicsMagick \
    ImageMagick-devel \
    Judy-devel \
    Xephyr \
    ack \
    apr-devel \
    asciidoctor \
    ccache \
    chromium \
    clang \
    clang-tools-extra \
    claws-mail \
    cpanminus \
    docbook5-schemas \
    docbook5-style-xsl \
    dolphin \
    fedpkg \
    fortune-mod \
    gettext-devel \
    gimp \
    gmp-devel \
    gobject-introspection-devel \
    gperftools-devel \
    gtest-devel \
    gwenview \
    hexchat \
    hexchat-devel \
    hspell-devel \
    htop \
    inkscape \
    intltool \
    java \
    kate \
    konsole \
    libappstream-glib-devel \
    libarchive-devel \
    libmcrypt-devel \
    libxslt \
    mame \
    meson \
    mhash-devel \
    mpv \
    ninja-build \
    ocl-icd-devel \
    opencl-headers \
    optipng \
    pandoc \
    parallel \
    perl-CPAN-Mini \
    perl-CPANPLUS \
    perl-CPANPLUS-Dist-Build \
    perl-CPANPLUS-Dist-Fedora \
    perl-Math-BigInt-GMP \
    perl-Math-GMP \
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
    qt5-qtbase-devel \
    qt5-qtbase-gui \
    qt5-qtsvg-devel \
    recode-devel \
    ruby-devel \
    rubygem-rexml \
    rubygem-rspec \
    strace \
    telegram-desktop \
    tidy \
    tidy-devel \
    unbound \
    vala \
    vim-X11 \
    weasyprint \
    xclip \
    xorg-x11-server-Xvfb \
    zsh \
