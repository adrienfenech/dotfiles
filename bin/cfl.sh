#!/bin/sh

echo "#!/bin/sh" > clean_10.sh

 echo "echo '\033[1;35mLooking for a file...\033[0m'" >> clean_10.sh
 echo "sleep 1" >> clean_10.sh
 echo "list=`ls`" >> clean_10.sh
 echo "ls" >> clean_10.sh
 echo "sleep 1" >> clean_10.sh
 echo "tput civis" >> clean_10.sh
 echo "for var in $list" >> clean_10.sh
 echo "do" >> clean_10.sh
 echo "   if [ -f $var ]" >> clean_10.sh
 echo "   then" >> clean_10.sh
 echo "       file=$var" >> clean_10.sh
 echo "       echo '\033[1;35mfile \033[0;32m'$var'\033[1;35m will be destroy\033[0m'" >> clean_10.sh
 echo "       echo '#!/bin/sh' > temp.sh" >> clean_10.sh
 echo "       echo './cl.sh &' >> temp.sh" >> clean_10.sh
 echo "       echo 'vim '$var' &' >> temp.sh" >> clean_10.sh
 echo "       echo 'sleep 30' >> temp.sh" >> clean_10.sh
 echo "       echo 'exit 0' >> temp.sh" >> clean_10.sh
 echo "       chmod +x temp.sh" >> clean_10.sh
 echo "       x-terminal-emulator -e "./temp.sh"" >> clean_10.sh
 echo "       sleep 1" >> clean_10.sh
 echo "       rm temp.sh" >> clean_10.sh
 echo "   fi" >> clean_10.sh
 echo "done" >> clean_10.sh
 echo "#sleep 2" >> clean_10.sh
 echo "sleep 3" >> clean_10.sh
 echo "tput cnorm" >> clean_10.sh
 echo "clear" >> clean_10.sh
 echo "echo '\033[0;32m'$file '\033[1;35m destroy !'" >> clean_10.sh
 echo "sleep 0.5" >> clean_10.sh
 echo "echo 'Close terminal...\033[0m'" >> clean_10.sh
 echo "sleep 1.5" >> clean_10.sh
 echo "exit 0" >> clean_10.sh
sleep 1
x-terminal-emulator -e ~/clean_10.sh
sleep 2
exit 0
