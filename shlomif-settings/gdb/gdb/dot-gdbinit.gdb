set history filename ~/conf/gdb/gdb_history
set history save
set build-id-verbose 2
add-auto-load-safe-path ~/Download/unpack/net/www/mozilla/hg/.gdbinit
# See: https://elinux.org/GDB
handle SIG32 noprint
# See: https://stackoverflow.com/questions/100444/how-to-set-breakpoints-on-future-shared-libraries-with-a-command-flag
set breakpoint pending on
# See: https://inkscape.org/develop/debugging/
set pagination off
