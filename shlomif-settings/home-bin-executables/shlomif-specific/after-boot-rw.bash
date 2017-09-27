#!/bin/sh
mount -o remount,rw /sys/fs/cgroup
mount -o remount,rw /
mount -o remount,rw /usr
/etc/init.d/mandrake_everytime
cp -f /etc/resolv.conf.orig /etc/resolv.conf
service postfix restart
service httpd restart
systemctl restart udisks2.service
