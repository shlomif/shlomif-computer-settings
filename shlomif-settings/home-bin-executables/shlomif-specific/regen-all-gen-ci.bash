#!/usr/bin/env bash
#
# regen-all-gen-ci.bash
# Copyright (C) 2018 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under terms of the MIT license.
#
locate --regex '/\.git$' | xargs dirname | perl -lnE 'my $f = "$_/.ci-gen.ini"; if (-f $f) { say "== $_ ; $f =="; say `cd $_ ; ci-generate ; git diff ; git status -s`}' 2>&1 | gvim -
