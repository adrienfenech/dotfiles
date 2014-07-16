#This script use bash

colorLigne='\033[0;32m'
color='\033[1;37m'
colorFd='\033[2;37m'
colorFdBlack='\033[1;40m'
Ligne='\033[A'
colorErrG='\033[1;31m'
colorErr='\033[2;31m'
colorUpEnd='\033[2;32m'
colorTitle='\033[1;92m'
colorNormal='\033[1;33m'
colored='\033[1;34m'
null='\033[0m'

last="test"

fun_initialization()
{
clear
id=0;
tmp=0;
if [ $# -ne 0 ]&&[ $1 -eq 1 ]; then
	while [ $tmp -ne 4 ]; do
		if [ $id -eq 0 ]; then
			echo ' '$Ligne $colorTitle'speCtre'$colorErrG' loading... [-] '$null
			id=1
		elif [ $id -eq 1 ]; then
			echo ' '$Ligne $colorUp'speCtre'$colorErrG' loading... [\\] '$null
			id=2
		elif [ $id -eq 2 ]; then
			echo ' '$Ligne $colorTitle'speCtre'$colorErrG' loading... [|] '$null
			id=3
		elif [ $id -eq 3 ]; then
			echo ' '$Ligne $colorUp'speCtre'$colorErrG' loading... [/] '$null
			id=0
			tmp=$(($tmp + 1))
		else
			tmp=-1
		fi
		sleep 0.1
	done
	echo ' '$Ligne $colorTitle'speCtre'$colorUpEnd' loading... ['$colorTitle'DONE'$colorUpEnd'] '$null
else
	while [ $id -ne 100 ]; do
		echo ' '$Ligne $colorTitle 'speCtre'$colorErrG' loading... ['$id'%] '$null
		id=$(($id + 1))
		sleep 0.01
	done
		echo ' '$Ligne $colorTitle 'speCtre'$colorUpEnd' loading... ['$colorTitle$id'%'$colorUpEnd'] '$null
fi
}

fun_help()
{
	echo $colorLigne'In this version of '$colorTitle'speCtre'$colorLigne', you can use the command :'$null
	echo $colorUp'MODULE'$null
	echo $colored'-'$colorNormal'C'$colored'-             => Launch Creation module'$null
	echo $colored'-'$colorNormal'K'$colored'-             => Launch Connection module'$null
	echo $colored'-'$colorNormal'N'$colored'-             => Launch Notes module'$null
	echo $colored'-'$colorNormal'P'$colored'-             => Launch Project module'$null
	echo $colored'-'$colorNormal'I'$colored'-             => Launch Internet module'$null
	echo $colored'-'$colorNormal'S'$colored'-             => Launch Stylinette module'$null
	echo $colored'-'$colorNormal'T'$colored'-             => Launch Tree module'$null
	echo $colorUp'OPTION'$null
	echo $colored'-'$colorNormal'vim [pattern]'$colored'- => Open with vim the file -pattern-'$null
	echo $colored'-'$colorNormal'zl'$colored'-            => Lock screen'$null
	echo $colored'-'$colorNormal'cd'$colored'-            => Change the current directory'$null
	echo $colored'-'$colorNormal'ls'$colored'-            => Show the current directory'$null
	echo $colored'-'$colorNormal'help'$colored'-          => Show this help'$null
	echo $colored'-'$colorNormal'clear'$colored'-         => Clear the screen'$null
	echo $colored'-'$colorNormal'exit'$colored'-          => Shutdown the '$colorTitle'speCtre'$colored' module'$null
	echo $colorUp'USELESS'$null
	echo $colored'-'$colorNormal'joke'$colored'-          => Display a joke'$null
}

fun_joke()
{
	echo 'Do you know Megan, Jimmy or Lucie...?'
}

fun_err()
{
	#if [ $last == $1 ]
	#then
	#	echo $colorErrG'What did I say ?!'$null
	if [ $1 != "speCtre" ]
	then
		echo $colorErrG'I am embarassed, I do not know the meaning of -'$colorNormal$1$colorErrG'-.'$null
		echo $colorErrG'Can you enter the command again...'$null
	else
		echo $colorErrG'You cannot open an other '$colorNormal$1$colorErrG' module dude.'$null
		echo $colorErrG'It is so stupid...'$null
	fi		
}

mkdir speCtre_log
fun_initialization
screen_speCtre
echo $colorLigne'Welcome on '$colorTitle'speCtre'$colorLigne' module.'$null

while [ 1 ]
do
	echo -n $color'Which action do you want to do... ['$colorFd'help'$color'] ? '$colorNormal
	read cmd;
	case $cmd in
		## MODULE
		"C" )
			clear
			create 2>speCtre_log/create.log;;
		"K" )
			clear
			connection 2>speCtre_log/connection.log;;
		"N" )
			clear
			echo -n $colorLigne'Note to save : '$color
			read not
			notes $not 2>speCtre_log/notes.log;;
		"P" )
			clear
			screen_speCtre
			projet 2>speCtre_log/projet.log;;
		"I" )
			clear
			internet_start 2>speCtre_log/internet.log ;;
		"S" )
			clear
			stylinette 2>speCtre_log/stylinette.log;;
		"T" )
			clear
			tree.sh 2>speCtre_log/tree.log;;
		## USELESS
		"joke" )
			fun_joke;;
		## OPTION
		"zl" )
			i3lock -i ~/Images/Space.png;;
		"help" )
			fun_help;;
		"clear" | "celar" )
			clear
			screen_speCtre
			echo $colorLigne'Welcome on '$colorTitle'speCtre'$colorLigne' module.'$null;;
		"exit"* )
			break;;
		"ls"* | "cd"* | "vim"* )
			$cmd;;
		* )
			fun_err $cmd;;
	esac
	if [ $? -eq 42 ]; then exit 42; fi
	last=$cmd
done
clear
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
echo -n $color"Do you want a report of "$colorTitle"speCtre"$color"'s errors ? [y/*] "$null
read cmd
case $cmd in
	'y' )
		for file in $PWD"/speCtre_log/*"
		do
			fun_check_sleep 20
			echo ''
			wc -l $file
		done;;
	* )
		echo '';;
esac
echo $colored'Thank you to use the module '$colorTitle'speCtre'$colored'.'
exit 0;
