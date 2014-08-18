#!/bin/bash
prefix="$HOME/apps/perl/perl-5.10.0-like-mdv"

# 3 6 14 15 16 21 23 24 29 32  ==> make test is succesful.
for I in 38 42 43 44 45 46 47 48 49 50 51 52 ; do
    (
    (cat /home/shlomi/Download/unpack/Mandriva/perl/SPECS/perl.spec |
        grep -P "^Patch$I" |
        perl -pe 's/^Patch\d+: //') ;
    (cat /home/shlomi/Download/unpack/Mandriva/perl/SPECS/perl.spec |
        grep -P "^%patch$I" |
        perl -pe 's/^%patch\d+ //')
    ) | \
    (read FN ; read OPTS ; patch $OPTS < /home/shlomi/Download/unpack/Mandriva/perl/SOURCES/"$FN")
done

sh Configure -des \
  -Dinc_version_list="5.8.8 5.8.7 5.8.6 5.8.5 5.8.4 5.8.3 5.8.2 5.8.1 5.8.0 5.6.1 5.6.0" \
  -Darchname=i386-linux \
  -Dcc='gcc' \
  -Doptimize="-O2" -DDEBUGGING=-g \
  -Dprefix="$prefix" -Dvendorprefix="$prefix" \
  -Dsiteprefix="$prefix" -Dsitebin="$prefix"/local/bin \
  -Dsiteman1dir="$prefix"/local/share/man/man1 \
  -Dsiteman3dir="$prefix"/local/share/man/man3 \
  -Dman3ext=3pm \
  -Dcf_by=Mandriva -Dmyhostname=localhost -Dperladmin=root@localhost -Dcf_email=root@localhost  \
  -Ud_csh \
  -Duseshrplib \
  -Duseithreads \
  -Di_db \
  -Di_ndbm \
  -Di_gdbm
