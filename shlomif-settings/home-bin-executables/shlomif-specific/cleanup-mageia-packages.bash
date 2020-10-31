#!/usr/bin/env bash
#
# cleanup-mageia-packages.bash
# Copyright (C) 2018 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under the terms of the MIT license.
#

e $(rpm -qa 'lib64opencv*')
e cvs-fast-export
e git-arch
e git-cvs
e glibc-devel
e gnome-control-center
e netprofile
e perl-Mojolicious
e perl-Test-XML
e python2-numpy
e ruby
e ruby-irb
e sselp
e task-shlomif-fizzbuzz
e task-shlomif-homesite
e wml
eo
