#!/bin/bash
perl Makefile.PL PREFIX="/home/shlomi/apps/perl/modules" INSTALLSITEBIN="\$(SITEPREFIX)/bin" INSTALLSITESCRIPT="\$(SITEPREFIX)/bin" && \
make && \
make test && \
make install

