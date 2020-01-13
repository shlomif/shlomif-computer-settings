#!/bin/sh
#
# Copyright (C) 2018 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under terms of the MIT license.
set -e -x
dnf -y install \
    aspell-devel \
    gc-devel \
    gdl-devel \
    gettext-devel \
    gsl-devel \
    lib64boost-devel \
    lib64cdr-devel \
    lib64double-conversion-devel \
    lib64gtest-devel \
    lib64gtkmm3.0-devel \
    lib64lcms2-devel \
    lib64soup-devel \
    lib64visio-devel \
    lib64wpg-devel \
    lib64xslt-devel \
    pango-devel \
    poppler-devel \
    poppler-glib-devel \
    potrace-devel \

