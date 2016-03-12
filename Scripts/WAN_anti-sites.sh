#!/bin/bash
# Author :
# Maxime POUVREAU <pouvreau.maxime@gmail.com>
#

# Ici je bloque youtube...
#iptables -A PREROUTING -t mangle -s 216.58.0.0/16 -j DROP

# Ici je bloque twitch...
iptables -A PREROUTING -t mangle -s 192.16.64.0/21 -j DROP
iptables -A PREROUTING -t mangle -s 192.16.64.0/21 -j DROP
iptables -A PREROUTING -t mangle -s 192.16.64.0/21 -j DROP

# Ici je bloque spotify...
iptables -A PREROUTING -t mangle -s 194.132.198.165 -j DROP
iptables -A PREROUTING -t mangle -s 194.132.197.147 -j DROP
iptables -A PREROUTING -t mangle -s 194.132.198.228 -j DROP
iptables -A PREROUTING -t mangle -s 194.132.196.178 -j DROP
iptables -A PREROUTING -t mangle -s 194.132.198.115 -j DROP
iptables -A PREROUTING -t mangle -s 194.132.196.163 -j DROP
iptables -A PREROUTING -t mangle -s 185.31.17.246 -j DROP
iptables -A PREROUTING -t mangle -s 193.235.232.0/24 -j DROP
iptables -A PREROUTING -t mangle -s 78.31.8.0/22 -j DROP
iptables -A PREROUTING -t mangle -s 78.31.12.0/22 -j DROP
iptables -A PREROUTING -t mangle -s 23.92.96.0/20 -j DROP
iptables -A PREROUTING -t mangle -s 194.71.148.0/22 -j DROP
iptables -A PREROUTING -t mangle -s 194.68.28.0/22 -j DROP
iptables -A PREROUTING -t mangle -s 194.68.183.0/24 -j DROP
iptables -A PREROUTING -t mangle -s 194.68.181.0/24 -j DROP
iptables -A PREROUTING -t mangle -s 194.68.176.0/22 -j DROP
iptables -A PREROUTING -t mangle -s 194.68.165.0/24 -j DROP
iptables -A PREROUTING -t mangle -s 194.68.116.0/24 -j DROP
iptables -A PREROUTING -t mangle -s 194.14.177.0/24 -j DROP
iptables -A PREROUTING -t mangle -s 194.132.204.0/22 -j DROP
iptables -A PREROUTING -t mangle -s 194.132.196.0/22 -j DROP
iptables -A PREROUTING -t mangle -s 194.132.176.0/22 -j DROP
iptables -A PREROUTING -t mangle -s 194.132.173.0/24 -j DROP
iptables -A PREROUTING -t mangle -s 194.132.172.0/24 -j DROP
iptables -A PREROUTING -t mangle -s 194.132.168.0/22 -j DROP
iptables -A PREROUTING -t mangle -s 194.132.162.0/24 -j DROP
iptables -A PREROUTING -t mangle -s 194.132.152.0/22 -j DROP
iptables -A PREROUTING -t mangle -s 194.103.36.0/22 -j DROP
iptables -A PREROUTING -t mangle -s 194.103.13.0/24 -j DROP
iptables -A PREROUTING -t mangle -s 194.103.10.0/24 -j DROP
iptables -A PREROUTING -t mangle -s 193.235.32.0/24 -j DROP
iptables -A PREROUTING -t mangle -s 193.235.232.0/22 -j DROP
iptables -A PREROUTING -t mangle -s 193.235.224.0/24 -j DROP
iptables -A PREROUTING -t mangle -s 193.235.206.0/24 -j DROP
iptables -A PREROUTING -t mangle -s 193.235.203.0/24 -j DROP
iptables -A PREROUTING -t mangle -s 193.234.240.0/22 -j DROP
iptables -A PREROUTING -t mangle -s 193.182.8.0/21 -j DROP
iptables -A PREROUTING -t mangle -s 193.182.7.0/24 -j DROP
iptables -A PREROUTING -t mangle -s 193.182.3.0/24 -j DROP
iptables -A PREROUTING -t mangle -s 193.182.244.0/24 -j DROP
iptables -A PREROUTING -t mangle -s 193.182.243.0/24 -j DROP
iptables -A PREROUTING -t mangle -s 193.181.4.0/22 -j DROP
iptables -A PREROUTING -t mangle -s 193.181.180.0/22 -j DROP
iptables -A PREROUTING -t mangle -s 192.165.160.0/22 -j DROP
iptables -A PREROUTING -t mangle -s 192.121.53.0/24 -j DROP
iptables -A PREROUTING -t mangle -s 192.121.132.0/24 -j DROP

# Ici je bloque deezer...
iptables -A PREROUTING -t mangle -s 78.40.123.183 -j DROP
iptables -A PREROUTING -t mangle -s 78.40.123.182 -j DROP

# Ici je bloque soundcloud...
iptables -A PREROUTING -t mangle -s 93.184.220.127 -j DROP

# Ici je bloque dailymotion...
iptables -A PREROUTING -t mangle -s 195.8.215.136 -j DROP

# Ici je bloque skype...
iptables -A PREROUTING -t mangle -s 23.97.215.12 -j DROP
iptables -A PREROUTING -t mangle -s 111.221.74.0/24 -j DROP
iptables -A PREROUTING -t mangle -s 111.221.77.0/24 -j DROP
iptables -A PREROUTING -t mangle -s 157.55.130.0/24 -j DROP
iptables -A PREROUTING -t mangle -s 157.55.235.0/24 -j DROP
iptables -A PREROUTING -t mangle -s 157.55.56.0/24 -j DROP
iptables -A PREROUTING -t mangle -s 157.56.52.0/24 -j DROP
iptables -A PREROUTING -t mangle -s 213.199.179.0/24 -j DROP
iptables -A PREROUTING -t mangle -s 64.4.23.0/24 -j DROP
iptables -A PREROUTING -t mangle -s 65.55.223.0/24 -j DROP
iptables -A PREROUTING -t mangle -s 91.190.218.0/23 -j DROP
iptables -A PREROUTING -t mangle -s 91.190.216.0/23 -j DROP
iptables -A PREROUTING -t mangle -s 192.26.92.30 -j DROP
iptables -A PREROUTING -t mangle -s 192.31.80.30 -j DROP
iptables -A PREROUTING -t mangle -s 192.12.94.30 -j DROP
iptables -A PREROUTING -t mangle -s 192.35.51.30 -j DROP
iptables -A PREROUTING -t mangle -s 192.42.93.30 -j DROP
iptables -A PREROUTING -t mangle -s 192.54.112.30 -j DROP
iptables -A PREROUTING -t mangle -s 192.43.172.30 -j DROP
iptables -A PREROUTING -t mangle -s 192.48.79.30 -j DROP
iptables -A PREROUTING -t mangle -s 192.52.178.30 -j DROP
iptables -A PREROUTING -t mangle -s 192.41.162.30 -j DROP
iptables -A PREROUTING -t mangle -s 192.55.83.30 -j DROP
iptables -A PREROUTING -t mangle -s 192.33.14.30 -j DROP
iptables -A PREROUTING -t mangle -s 192.5.6.30 -j DROP
iptables -A PREROUTING -t mangle -s 111.221.74.0/24 -j DROP
iptables -A PREROUTING -t mangle -s 111.221.77.0/24 -j DROP
iptables -A PREROUTING -t mangle -s 157.55.130.0/24 -j DROP
iptables -A PREROUTING -t mangle -s 157.55.235.0/24 -j DROP
iptables -A PREROUTING -t mangle -s 157.55.56.0/24 -j DROP
iptables -A PREROUTING -t mangle -s 157.56.52.0/24 -j DROP
iptables -A PREROUTING -t mangle -s 213.199.179.0/24 -j DROP
iptables -A PREROUTING -t mangle -s 64.4.23.0/24 -j DROP
iptables -A PREROUTING -t mangle -s 65.55.223.0/24 -j DROP

# Ici je bloque tor (le browser)...
iptables -A PREROUTING -t mangle -s 193.11.114.43 -j DROP
iptables -A PREROUTING -t mangle -s 188.166.154.140 -j DROP

# Ici je bloque le torrent (j'essaie)...
iptables -A PREROUTING -t mangle -p tcp --dport 6881:6889 -j DROP
iptables -A PREROUTING -t mangle -p tcp --sport 6881:6889 -j DROP
iptables -A PREROUTING -t mangle -p tcp --dport 6969 -j DROP
iptables -A PREROUTING -t mangle -p tcp --sport 6969 -j DROP
iptables -A PREROUTING -t mangle -p udp --dport 6881:6889 -j DROP
iptables -A PREROUTING -t mangle -p udp --sport 6881:6889 -j DROP
iptables -A PREROUTING -t mangle -p udp --dport 6969 -j DROP
iptables -A PREROUTING -t mangle -p udp --sport 6969 -j DROP
