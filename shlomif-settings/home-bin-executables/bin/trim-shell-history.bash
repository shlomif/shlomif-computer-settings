cat "$HOME"/.histfile | perl -lapE 's%^:\s*[0-9]+:[0-9]+;%%; s/\s+$//;s/  +/ /' | tac | perl -lanE 'say unless $h{$_}++' | tac
