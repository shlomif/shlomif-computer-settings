#! /usr/bin/env bash
#
# shlomify.bash
# Copyright (C) 2021 Shlomi Fish < https://www.shlomifish.org/ >
#
# Distributed under the terms of the MIT license.
#

dnf5 -y builddep fortune-mod freecell-solver gimp inkscape
    # kpat

install_fluff()
{
    dnf5 -y install \
        'perl(Math::Random::MT)' \
        chromium \
        mame \
        pysol
}

dnf5 -y install \
    'perl(Bit::Vector)' \
    'perl(Image::Size)' \
    'perl(Inline::Python)' \
    'perl(Math::GMP)' \
    'perl(Math::Int128)' \
    'perl(Number::Format)' \
    'perl(Pod::Coverage::TrustPod)' \
    'perl(Test::Pod)' \
    'perl(Test::Pod::Coverage)' \
    'perl(YAML::XS)' \
    'rubygem(nokogiri)' \
    'rubygem(rexml)' \
    GraphicsMagick \
    ImageMagick-devel \
    Judy-devel \
    Xephyr \
    ack \
    apr-devel \
    asciidoctor \
    bat \
    bison \
    byacc \
    ccache \
    clang \
    clang-tools-extra \
    claws-mail \
    cpanminus \
    docbook5-schemas \
    docbook5-style-xsl \
    dolphin \
    dzil \
    fedpkg \
    flake8 \
    fop \
    fortune-mod \
    gettext-devel \
    gimp \
    gjs-devel \
    gmp-devel \
    gobject-introspection-devel \
    golang-bin \
    golang-src \
    gperftools-devel \
    gtest-devel \
    gwenview \
    hexchat \
    hexchat-devel \
    hspell \
    hspell-devel \
    htop \
    hunspell-en-GB \
    inkscape \
    intltool \
    java \
    javac \
    kate \
    keysmith \
    konsole \
    levien-inconsolata-fonts \
    libappstream-glib-devel \
    libarchive-devel \
    libmcrypt-devel \
    libmikmod-devel \
    libxslt \
    libyaml-devel \
    meson \
    mhash-devel \
    mpv \
    myrepos \
    ninja-build \
    ocl-icd-devel \
    opencl-headers \
    optipng \
    pandoc \
    parallel \
    pcre-devel \
    perl-CPAN-Mini \
    perl-CPANPLUS \
    perl-CPANPLUS-Dist-Build \
    perl-CPANPLUS-Dist-Fedora \
    perl-Inline-Python \
    perl-Math-BigInt-GMP \
    perl-Math-GMP \
    perl-Text-Hunspell \
    perl-XML-LibXSLT \
    perl-local-lib \
    pidgin \
    pocl-devel \
    postfix \
    primesieve \
    primesieve-devel \
    purple-facebook \
    pylint \
    pypy3 \
    pysassc \
    python-neovim \
    python3-attrs \
    python3-libsass \
    python3-pyside6 \
    python3-pytest \
    python3-random2 \
    python3-tomli \
    python3-tox \
    python3-vlc \
    python3-wheel \
    qt5-qtbase-devel \
    qt5-qtbase-gui \
    qt5-qtsvg-devel \
    recode-devel \
    rspec \
    ruby-devel \
    rubygem-rexml \
    rubygem-rspec \
    rubygem-rspec-expectations \
    strace \
    telegram-desktop \
    tidy \
    tidy-devel \
    unbound \
    vala \
    vim-X11 \
    weasyprint \
    xclip \
    xhtml1-dtds \
    xorg-x11-server-Xvfb \
    zsh \
