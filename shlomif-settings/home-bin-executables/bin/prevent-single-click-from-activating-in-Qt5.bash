#!/bin/bash

# See Tech Tip: How to Prevent Single Clicks from Playing/Activating a File in
# the Qt5-based VLC-2.2.0 on KDE 4 (and allow for other Qt 5 customisations).
#
# http://shlomif-tech.livejournal.com/69991.html

kwriteconfig --file ~/.config/kdeglobals --group "KDE" --key "SingleClick" --type "bool" 0
