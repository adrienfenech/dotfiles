#!/bin/sh
Ligne='\033[A'
Title='\033[1;92m'
null='\033[0m'
timer=30
count=1

while [ 1 ]
do
	perl ~/jogsoul/jogsoul.pl ~/jogsoul/jogsoul.conf
	echo 'Connection n° '$Title$count$null' with '$Title'jogsoul'$null'.'
	echo ''
	timer=30
	count=$(($count+1))
	while [ $timer -ne -1 ]
	do
		echo $Ligne 'Auto-connection in... '$Title$timer$null' '
		sleep 1
		timer=$(($timer-1))
	done
done
