#!/bin/bash
(
while true ; do
    echo "date=$(date)"
    echo "date s=$(date +%s)"
    echo "ps auxwwwwwwwwww="
    echo "<<<"
    ps auxwwwwwwwwwwwwwwwwwwwwwwwwwww
    echo ">>>"
    echo "df="
    echo "<<<"
    \df
    echo ">>>"
    echo "ls -lA ~/tmp="
    echo "<<<"
    ls -lA ~/tmp
    echo ">>>"
    sleep 600
done
) | timestamper >> /var/tmp/shlomif-fc-solve-monitor.txt
