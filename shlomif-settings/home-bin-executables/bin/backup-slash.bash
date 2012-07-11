#!/bin/bash
# This script backs up the root ("/") directory.
tar --exclude=/home --exclude=/mnt --exclude=/proc --exclude=/sys --exclude=/dev -czvf /home/slash-dir-backup.tar.gz /
