#!/usr/bin/env bash
cat /home/shlomi/progs/Rpms/SOURCES/eperl-2.2.14.dif | patch -p 0
cat /home/shlomi/progs/Rpms/SOURCES/eperl.dif | patch -p 2
cat /home/shlomi/progs/Rpms/SOURCES/eperl-2.2.14-perl58.dif | patch -p 0
cat /home/shlomi/progs/Rpms/SOURCES/eperl-2.2.14-perlvendor.dif | patch -p 0
cat /home/shlomi/progs/Rpms/SOURCES/eperl-2.2.14-headsyntax.dif | patch -p 0
cat /home/shlomi/conf/build/apache1-eperl/eperl-patch-script.bash | patch -p 0
