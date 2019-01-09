#! /usr/bin/env bash
#
# Copyright (C) 2018 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under terms of the MIT license.
#
( for i in $(dnf repoquery --qf "%{NAME}" 'python3-*' | grep -vP 'aeidon|^python3-(async|aws-cli|backports.os|celery|cherrypy|docker-py|docker-scripts|getdist|kombu|libguestfs|(?:(?:django|dogpile-|ffmpeg-|font|jupyter).*))$' | perl -lnE 'say if /^python3-ma/..1') ; do dnf -y install "$i" || urpmi --auto "$i" || exit ; done)
