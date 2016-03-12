#!/bin/bash
# Author :
# Maxime POUVREAU <pouvreau.maxime@gmail.com>
#

############################
LOGFILE=/var/log/wan_ban-ip

# Si pas lancé en root
if [[ $EUID -ne 0 ]] ; then
	echo "Le programme doit être lancé en root."
	exit 0
fi

# Si mode ban
if test "$1" = "-ban" || test "$1" = "-b" ; then
	while true ; do
		# On est user-friendly quand même...
		echo "################################################"
		echo "Quelle IP bannir ? :"
		read IP
		echo "Combien de minutes ? [1-720] (defaut 1min) :"
		read T
	
		# Si le temps n'est pas raisonnable...
		if test -z $T || test $T -lt 0 || test $T -gt 720 ; then
			T=1
		fi
		
		# Si l'IP est bien une IP !
		if [[ "$IP" =~ ^(([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])$ ]] ; then
			echo "Bannir l'IP $IP pour $T minute(s) ? [O/n]"
			read confirm
			# On s'assure que c'est bien ce qu'on veut faire...	
			if test "$confirm" = "O" || test "$confirm" = "o" || test "$confirm" = "" ; then
				# On ajoute la règle, on bannit l'IP...
				iptables -A PREROUTING -t mangle -s $IP -j DROP && echo "+ $IP ; `date -R|cut -d' ' -f5`" >> $LOGFILE
				# On attends le temps défini PUIS on débannit...
				(sleep "$T"m && iptables -D PREROUTING -t mangle -s $IP -j DROP && echo "- $IP && `date -R|cut -d' ' -f5`" >> $LOGFILE) &
			else
				echo "L'IP $IP ne sera pas bannie"
			fi
		else
			echo "Ce n'est pas une IP..."
		fi
	done
elif test "$1" = "-deban" || test "$1" = "-unban" || test "$1" = "-d" || test "$1" = "-u" ; then
	while true ; do
		# On est user-friendly quand même...
		echo "################################################"
		echo "Quelle IP debannir ? :"
		read IP
	
		# Si l'IP en est bien une
		if [[ "$IP" =~ ^(([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])$ ]] ; then
			echo "Debannir l'IP $IP ? [O/n]"
			read confirm
			# On s'assure que c'est bien ce qu'on veut faire...     
			if test "$confirm" = "O" || test "$confirm" = "o" || test "$confirm" = "" ; then
				# On attends le temps défini PUIS on débannit...
				iptables -D PREROUTING -t mangle -s $IP -j DROP && echo "- $IP ; `date -R|cut -d' ' -f5`" >> $LOGFILE
			else
				echo "L'IP $IP ne sera pas debannie"
			fi
		else
			echo "Ce n'est pas une IP..."
		fi
	done
else
	echo "Utilisation du script :"
	echo "./WAN_ban-ip.sh <options>"
	echo "-------------------------"
	echo "Les options sont :"
	echo "     -ban, -b                    Entrer dans le mode pour bannir des adresses IP."
	echo "     -deban, -unban, -d, -u      Entrer dans le mode pour debannir des adresses IP."
fi
