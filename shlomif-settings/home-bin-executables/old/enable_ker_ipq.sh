#!/bin/sh

# The Expat License
#
# Copyright (c) 2017, Shlomi Fish
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

#modprobe ip_queue
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
