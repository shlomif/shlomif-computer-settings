#! /usr/bin/env bash
#
# Copyright (C) 2018 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under terms of the MIT license.
#
( for i in $(dnf repoquery --qf "%{NAME}" 'python3-*' | grep -vP 'aeidon|^python3-(async|aws-cli|backports.os|celery|cherrypy|(?:(?:django|dogpile-).*)|docker-py|docker-scripts)$' | perl -lnE 'say if /^python3-e/..1') ; do dnf -y install "$i" || exit ; done)
