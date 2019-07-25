#! /bin/sh
#
# vim.xdo.sh
# Copyright (C) 2019 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under terms of the MIT license.
#


f()
{
    ff="$1"
    xdotool key $(perl -lE 'print join " ",map {+{":"=>"colon"," "=>"space","/"=>"slash","."=>"period","-"=>"minus","\n"=>"Return",}->{$_} // $_}split//,shift' "$ff")
}
# echo $(perl -lE 'print join " ",map {$_ eq " "?"Space":$_}split//,"vim /home/shlomif/conf/trunk/shlomif-settings/setup-all/setup-all.pl"')
wid=`xdotool search "Konsole" | head -1`
# xdotool windowactivate --sync "$wid"
f $'vim /home/shlomif/conf/trunk/shlomif-settings/setup-all/setup-all.pl\n'
sleep 2
f $':colorscheme default\n'
sleep 2
f $':q\n'
