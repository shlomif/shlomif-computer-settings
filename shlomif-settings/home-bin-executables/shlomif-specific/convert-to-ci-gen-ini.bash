#!/usr/bin/env bash
#
# regen-all-gen-ci.bash
# Copyright (C) 2018 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under terms of the MIT license.
#
locate --regex '/\.git$' | xargs dirname | perl -MSQ -lnE 'use IO::All; my $f = "$_/.gen-ci.bash"; my $n = "$_/.ci-gen.ini"; if (-f $f and 1) { say "== $_ ; $f =="; $t = io($f)->all; ($the) = $t =~ /--theme\s+(\S+)/ms or $the = "XML-Grammar-Fiction" ; $the =~ s/$S//g; ($p)= $t =~ /--param $S(\S+?)$S/; io($n)->print("theme = $the\n", ($p ? "\n[param]\n\n" . ($p =~ s/=/ = /r) . "\n" : "")); say ` cd $_ ; git add .ci-gen.ini; ci-generate ; git diff`}' 2>&1 | gvim -

