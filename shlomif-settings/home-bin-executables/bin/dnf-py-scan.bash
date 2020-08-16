#! /usr/bin/env bash
#
# Copyright (C) 2018 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under the terms of the MIT license.
#
( for i in $(dnf repoquery --qf "%{NAME}" 'python3-*' | grep -vP 'aeidon|^python3-(async|aws-cli|backports.os|celery|cherrypy|docker-py|docker-scripts|getdist|kombu|libguestfs|mpi4py|mpi4py-devel|ndg-httpsclient|odfpy|opencv|pandas|plplot|protorpc|py2pack|pymc|qgis|qstk|sleekxmpp|tqdm|socksipy-branch|sphinxcontrib-trio|trollius|trollius-redis|trololio|xmpp-backends|(?:(?:django|dogpile-|ffmpeg-|font|jupyter|pycrypto|pytest-django|rust|scikit).*))$' | perl -lnE 'say if /^python3-/..1') ; do dnf -y install "$i" || urpmi --auto "$i" || exit ; done)
