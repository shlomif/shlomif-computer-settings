source ~/conf/gdb/kde-devel-gdb
set breakpoint pending on
set args "/home/shlomif/Music/mp3s/Gladiator OST/17 - Now We Are Free.mp3"
# b EngineController.cpp:172
r --debug --nofork
