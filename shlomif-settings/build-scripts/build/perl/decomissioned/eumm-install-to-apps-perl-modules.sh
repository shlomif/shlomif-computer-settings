#!/bin/bash
perl Makefile.PL PREFIX="$HOME/apps/perl/modules" INSTALLSITEBIN="\$(SITEPREFIX)/bin" INSTALLSITESCRIPT="\$(SITEPREFIX)/bin" && \
make && \
make test && \
make install

