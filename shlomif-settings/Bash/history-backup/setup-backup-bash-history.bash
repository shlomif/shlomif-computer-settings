#!/bin/bash

base="$HOME/Backup/bash-history/"
mkdir -p "$base"

repo_dir="$base/svn-repos"
svnadmin create "$repo_dir"
url="file://$repo_dir"


svn mkdir -m "Creating bash-history mini-repos" "$url/bash-history"
svn mkdir -m "Creating the bash-history trunk" "$url/bash-history/trunk"

(
    cd $base
    svn co "$url/bash-history/trunk"
    cd trunk
    svn mkdir "bash-history"
    svn ci -m "Committing dir structure"
)

perl ~/bin/backup-bash-history.pl

(
    cd $base
    cd trunk/bash-history
    ls | grep -v '*~' | xargs svn add
    svn ci -m "Initial commit with $(wc -l bash_history) lines"
)
