#!/bin/sh

## This is a module to connect to an other computer
## using the ssh protocol

Ligne='\033[A'
colorLigne='\033[0;32m'
color='\033[1;37m'
colorNG='\033[0;37m'
colorFd='\033[2;37m'
Ligne='\033[A'
colorErrG='\033[1;31m'
colorErr='\033[2;31m'
colorUpEnd='\033[2;32m'
colorTitle='\033[1;92m'
colorNormal='\033[1;33m'
colored='\033[1;34m'
colorFdBlack='\033[1;40m'
null='\033[0m'

connect=0

fun_check_sleep()
{
	count=0
	while [ $count -ne $1 ]
	do
		echo -n $colorFdBlack' '$null' '
		sleep 0.009
		count=$(($count+1))
	done
}

fun_connect()
{
while [ 1 ]
do
	echo -n $color'id/user of the computer on the server that you want to connect to: '$colorErrG
	read id_user
	echo -n $color'Server to use: '$colorErrG
	read server
	echo -n $color'Port to use: '$colorErrG
	read port
	clear
	echo $color'Id/User : '$colorNormal$id_user
	echo $color'Server  : '$colorNormal$server
	echo $color'Port    : '$colorNormal$port
	echo -n $color'Current information are valid ? [y/*] '$colorErrG
	read cmd
	case $cmd in
		'y' | 'Y' )
			break;;
		* )
			clear;;
	esac
done
while [ 1 ]
do
	echo $colorTitle'Starting connection...'$color
	ssh -vP $port $id_user@$server
	$null
	fun_check_sleep 10
	echo -n $color' Try again...? '$colorErrG
	read cmd
	case $cmd in
		'Y' | 'y' | 'YES' | 'yes' )
		timeleft=4
		echo ''
		while [ $timeleft -ne 0 ] 
		do
			echo $Ligne$color'\ttry again in '$colorTitle$timeleft$color'...'$null
			sleep 1
			timeleft=$(($timeleft-1))
		done;;
		* )
			break;;
	esac
done
}

clear
echo $color'Welcome on this '$colorTitle'connection'$color' module using '$colorNormal'ssh'$color' protocole.'$null
echo ''


while [ 1 ]
do
	echo -n $color'Do you want to connect to another computer or receive a connection ?[C/R] '$colorErrG
	read cmd
	case $cmd in
		'C' )
			connect=1
			break;;
		'R' )
			connect=-1
			break;;
		* )
			fun_check_sleep 37	
			echo ''
			echo $colorErr'Answer unexpected...'$null;;
	esac
done

if [ $connect -eq 1 ]
then
	fun_connect
else
	fun_receive
fi
