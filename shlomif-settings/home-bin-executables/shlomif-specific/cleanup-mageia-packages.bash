#!/usr/bin/env bash
#
# cleanup-mageia-packages.bash
# Copyright (C) 2018 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under terms of the MIT license.
#

e task-shlomif-homesite
e task-shlomif-fizzbuzz
e perl-Test-XML
e glibc-devel
e python2-numpy
e ruby
e ruby-irb
e wml
e $(rpm -qa 'lib64opencv*')
e gnome-control-center
e git-core
e netprofile
e sselp
e perl-Mojolicious
eo
