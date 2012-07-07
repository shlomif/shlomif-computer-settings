#!/bin/sh

REMOTE='ftp-stud.hs-esslingen.de'
LOCAL='/mnt/old-mandriva/Download/CPAN-Mini'

cd $LOCAL

if ! test -e "work" ; then
    mkdir "work"
fi

rsync $REMOTE::'CPAN/modules/03modlist.data.gz CPAN/modules/02packages.details.txt.gz' modules/

zcat modules/02packages.details.txt.gz | egrep '\.(tar\.gz|tgz|zip)$' | egrep -v '/((perl-|parrot-|ponie-)[0-9]|perl5\.004)' | awk '{print $3}' | sort -u >work/targets.dists

cat work/targets.dists | cut -d'/' -f1-3 | sort -u | perl -pe 's!$!/CHECKSUMS!;' >work/targets.checksums

cat work/targets.dists | perl -pe 's!/[^/]+$!\n!;' >work/targets.dirs

cd $LOCAL/authors/id

cat $LOCAL/work/targets.dirs | xargs -n100 mkdir -p

cat $LOCAL/work/targets.checksums | xargs -n100 touch

cat $LOCAL/work/targets.dists | xargs -n100 touch

cd $LOCAL

rsync -vr --size-only --existing $REMOTE::CPAN/authors/ authors/

find authors/id -name '*.*' | perl -pe 's!^authors/id/!!;' | sort -u >work/tree.all

sort -u work/targets.* | comm -13 - work/tree.all | perl -pe 's!^!authors/id/!;' | xargs rm -v
