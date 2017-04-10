cat ~/f | perl -lanE 'print $1 if /\A=== wrong patch (\S+)$/' | (while read i ; do svn rm PATCHES/patches/"$i" ; perl -i -l -n -E "say if \$_ ne q#$i#" PATCHES/patches/series ; done)
