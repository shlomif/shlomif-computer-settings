#!/bin/bash

. "$HOME/conf/Bash/backup/conf.bash"

mkdir -p "$backup_dir"
# Backup everything that is needed in a standard backup.
bash ~/bin/backup-home-dir.sh

