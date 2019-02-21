#!/usr/bin/env bash
# Taken from https://askubuntu.com/questions/224006/resetting-xfce-panels-to-default-settings
# by Evan Carroll under CC-by-sa .

# Thanks!
xfce4-panel --quit ; pkill xfconfd ; rm -rf ~/.config/xfce4/panel/ ; xfce4-panel ;
