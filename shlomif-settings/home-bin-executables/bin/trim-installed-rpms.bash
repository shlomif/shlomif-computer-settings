#!/usr/bin/env bash

sudo dnf remove $(rpm -qa '*-debugsource') $(rpm -qa '*-debuginfo')
sudo dnf remove clisp
sudo dnf remove chromium-browser-stable
sudo dnf remove geeqie
sudo dnf remove git-svn
sudo dnf remove gthumb
sudo dnf remove ikiwiki
sudo dnf remove libreoffice
sudo dnf remove task-mate-minimal
sudo dnf remove $(rpm -qa '*cocoalib*')
sudo dnf remove $(rpm -qa '*giac*')
