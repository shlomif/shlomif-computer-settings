#!/usr/bin/env bash
cd "$HOME"
d="$HOME/Backup/firefox-config/old-configs/"
mkdir -p "$d"
fn="$d/$(date +"%Y-%m-%d-%H").tar.xz"
nice -19 tar -caf "$fn" .mozilla 2>/dev/null
