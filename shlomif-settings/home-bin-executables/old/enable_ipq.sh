#!/bin/sh

modprobe ip_queue
/sbin/bastille-netfilter stop
/sbin/iptables -A INPUT -j ACCEPT -i lo -p tcp --source-port auth
/sbin/iptables -A INPUT -j ACCEPT -i lo -p tcp --destination-port auth
/sbin/iptables -A INPUT -j ACCEPT -i lo -p tcp --source-port 18300
/sbin/iptables -A INPUT -j ACCEPT -i lo -p tcp --destination-port 18300
/sbin/iptables -A INPUT -j ACCEPT -i lo -p tcp --source-port 631
/sbin/iptables -A INPUT -j ACCEPT -i lo -p tcp --destination-port 631
/sbin/iptables -A INPUT -j ACCEPT -i lo -p udp --source-port 631
/sbin/iptables -A INPUT -j ACCEPT -i lo -p udp --destination-port 631
/sbin/iptables -A INPUT -j ACCEPT -i lo -p tcp --source-port 4000
/sbin/iptables -A INPUT -j ACCEPT -i lo -p tcp --destination-port 4000
/sbin/iptables -A INPUT -j ACCEPT -i lo -p udp --source-port 111
/sbin/iptables -A INPUT -j ACCEPT -i lo -p udp --destination-port 111

/sbin/iptables -A INPUT -j QUEUE -i lo -p tcp
/sbin/iptables -A INPUT -j QUEUE -i lo -p udp
