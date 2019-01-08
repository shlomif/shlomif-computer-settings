#! /usr/bin/env bash
#
# Copyright (C) 2018 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under terms of the MIT license.
#
( for i in $(dnf repoquery --qf "%{NAME}" 'python3-*' | grep -vP 'aeidon|^python3-(async|aws-cli|backports.os|celery|cherrypy)$' | perl -lnE 'say if /^python3-d/..1') ; do dnf -y install "$i" || exit ; done)
