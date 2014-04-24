#!/bin/bash
perl Makefile.PL PREFIX="$HOME/apps/perl/modules" INSTALLSITEBIN="\$(SITEPREFIX)/bin" INSTALLSITESCRIPT="\$(SITEPREFIX)/bin" J2SDK=/usr/lib/jvm/java-1.7.0-openjdk-1.7.0.60-2.4.4.4.mga5.x86_64 && \
make && \
make test && \
make install

