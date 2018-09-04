#! /bin/bash
#
# regen-all-gen-ci.bash
# Copyright (C) 2018 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under terms of the MIT license.
#
locate --regex '/\.travis\.yml$' | xargs dirname | perl -lnE 'my $f = "$_/.gen-ci.bash"; if (-f $f) { say "== $_ ; $f =="; say `cd $_ ; bash .gen-ci.bash ; git diff`}' 2>&1 | gvim -
