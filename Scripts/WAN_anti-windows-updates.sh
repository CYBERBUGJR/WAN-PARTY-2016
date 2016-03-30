#!/bin/bash
# Author :
# Maxime POUVREAU <pouvreau.maxime@gmail.com>
#

for ip in `cat static_ban` ; do
        iptables -A PREROUTING -t mangle -s $ip -j DROP
        iptables -A PREROUTING -t mangle -d $ip -j DROP
done

iptables -A PREROUTING -t mangle -p udp --destination-port 8530 -j DROP
iptables -A PREROUTING -t mangle -p udp --destination-port 8531 -j DROP
iptables -A PREROUTING -t mangle -p udp --source-port 8530 -j DROP
iptables -A PREROUTING -t mangle -p udp --source-port 8531 -j DROP
iptables -A PREROUTING -t mangle -p tcp --destination-port 8530 -j DROP
iptables -A PREROUTING -t mangle -p tcp --destination-port 8531 -j DROP
iptables -A PREROUTING -t mangle -p tcp --source-port 8530 -j DROP
iptables -A PREROUTING -t mangle -p tcp --source-port 8531 -j DROP
