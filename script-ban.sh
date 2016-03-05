#!/bin/bash
# Authors :
# Maxime POUVREAU <pouvreau.maxime@gmail.com>
# Benjamin CALVET <cyberbugjr@gmail.com>
#

apt-get install at
clear
LOGFILE="/var/log/logs_ban_wan"

if test -z $1 ; then
	echo "Utilisation :"
	echo "----"
	echo "-[un|de]ban :"
	echo "Entre dans le mode pour [un|de]ban une IP"
	echo "----"
fi

if test "$1" = "-ban" ; then
while true ; do
	echo "################################################"
	echo "Quelle IP bannir ? :"
	read IP
	echo "Combien de minutes ? [1-720] (defaut 1min) :"
	read T
	
	if test -z $T || test $T -lt 0 || test $T -gt 720 ; then
		T=1
	fi

	if [[ "$IP" =~ ^(([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])$ ]] ; then
		echo "Bannir l'IP $IP ? [O/n]"
		read confirm
		if test -z "$confirm" || test "$confirm" = "O" || test "$confirm" = "o" ; then
			echo "+ $IP ; `date -R |cut -d' ' -f5`" >> $LOGFILE
			iptables -A PREROUTING -t mangle -s $IP -j DROP
			echo "IP bannie : $IP"
			(sleep "$T"m ; iptables -D PREROUTING -t mangle -s $IP -j DROP ; echo "- $IP ; `date -R |cut -d' ' -f5`" >> $LOGFILE) &
		fi
	else
		echo "Ce n'est pas une IP..."
	fi
done
elif test "$1" = "-unban" || test "$1" = "-deban" ; then
while true ; do
	echo "################################################"
	echo "Quelle IP débannir ? :"
	read IP

	 if [[ "$IP" =~ ^(([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][│0-9]|25[0-5])$ ]] ; then
		 echo "Débannir l'IP $IP ? [O/n]"
		 read confirm
		 if test -z "$confirm" || test "$confirm" = "O" || test "$confirm" = "o" ; then
			 iptables -D PREROUTING -t mangle -s $IP -j DROP ; echo "- $IP ; `date -R |cut -d' ' -f5`" >> $LOGFILE
			 echo "IP débannie : $IP"
		 fi
	else
		echo "Ce n'est pas une IP..."
	fi
done
fi
