# This code should be sourced into the current shell using
# Bash's "." or "source".
unalias c d k
c() { f="$(ls -S | tail -1)"; echo "== $f == " ; cat "$f"; }
d() { rm -f "$f"; unset f; }
k() { mv "$f" ../__keep-xchatlogs/ ; unset f; }
