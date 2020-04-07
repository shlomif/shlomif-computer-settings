#!/usr/bin/env bash

set -x

my_dnf_remove()
{
    sudo dnf $SHLOMIF_DNF_OPTS remove "$@"
}

my_dnf_remove $(rpm -qa '*-debugsource') $(rpm -qa '*-debuginfo')
my_dnf_remove clisp
my_dnf_remove chromium-browser-stable
my_dnf_remove geeqie
my_dnf_remove git-svn
my_dnf_remove gthumb
my_dnf_remove ikiwiki
my_dnf_remove libreoffice
my_dnf_remove task-mate-minimal
my_dnf_remove $(rpm -qa '*cocoalib*')
my_dnf_remove $(rpm -qa '*giac*')
