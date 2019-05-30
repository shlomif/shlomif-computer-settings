cat /home/shlomif/.histfile | perl -lapE 's/\s+$//;s/  +/ /' | tac | perl -lanE 'say unless $h{$_}++' | tac
