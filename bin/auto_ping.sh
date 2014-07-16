#!/bin/sh

Ligne='\033[A'
Title='\033[1;92m'
error='\033[1;31m'
colorFdBlack='\033[1;40m'
null='\033[0m'
timer=3
count=1
progress=0

fun_check_sleep()
{
	progress=0
	while [ $progress -ne $1 ]
	do
		echo -n $Title'-'$null' '
		sleep 0.04
		progress=$(($progress+1))
	done
}

while [ 1 ]
do
	ping -w 3 google.fr > 2&>1 > /dev/null
	if [ $? -ne 0 ]
	then
		echo -n $error'Connection... '
		perl ~/jogsoul/jogsoul.pl ~/jogsoul/jogsoul.conf
		sleep 1
		echo $Title'Complete'$null' !'
	else
		echo -n 'Ping n°'$Title$count$null' to '$Title'google.fr'$null'... '
		sleep 0.4
		echo $Title'OK'$null' !'
	fi
	timer=3
	echo ''
	echo $null'New ping in progress... '
	fun_check_sleep 40
	echo ''
	count=$((count+1))
done
