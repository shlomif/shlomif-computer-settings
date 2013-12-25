#!/bin/bash

base="$HOME/Backup/bash-history/"

repo_dir="$base/svn-repos"
backup="${repo_dir}.$(date +"%Y-%m-%d").svn-dump"
svnadmin dump "$repo_dir" > "$backup"
xz -9 "$backup"
rm -fr "$repo_dir" "$base/trunk"
bash ~/"$(dirname "$0")/setup-backup-bash-history.bash"

