#!/bin/sh
colorUpEnd='\033[2;32m'
colorTitle='\033[1;92m'
null='\033[0m'

screen_speCtre;
perl ~/jogsoul/jogsoul.pl  ~/jogsoul/jogsoul.conf
echo $colorUpEnd'   Internet ['$colorTitle'jogsoul'$colorUpEnd'] of speCtre:'$colorUpEnd' -->LOADED<--'$null
##xterm -geometry 40x3+0+40 ~/bin/auto_connection.sh &
##xterm -geometry 40x20+0+100 ~/bin/auto_ping.sh &
while [ 1 ]
do
	echo -n 'Open Chrome ? [\033[32my\033[0m/\033[34mreco\033[0m/\033[33mexit\033[0m]: '
	read response;
	if [ $response = 'y' ]
	then
		echo '\033[32mChrome starting...\033[0m'
		google-chrome &
	elif [ $response = 'quit' ]||[ $response = 'exit' ]
	then
		echo '\033[33mInternet shutting down...\033[0m'
		break;
	elif [ $response = 'reco' ]
	then
		perl ~/jogsoul/jogsoul.pl  ~/jogsoul/jogsoul.conf
		echo $colorUpEnd'   Internet ['$colorTitle'jogsoul'$colorUpEnd'] of speCtre:'$colorUpEnd' -->LOADED<--'$null
	else
		echo '\033[31mUnexpected Answer, try again...\033[0m'
	fi
done;
exit 0
