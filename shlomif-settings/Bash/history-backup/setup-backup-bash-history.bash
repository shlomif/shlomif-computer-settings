#!/bin/bash

base="$HOME/Backup/bash-history/"
mkdir -p "$base"

repo_dir="$base/git-repos"
mkdir -p "$repo_dir"
(cd "$repo_dir" && git init .)
mkdir -p "$repo_dir/bash-history"

perl ~/bin/backup-bash-history.pl
