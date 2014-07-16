#!/bin/sh


echo "#!/bin/sh" > cl.sh

echo "sleep 2" >> cl.sh
echo "count=200" >> cl.sh
echo "while [ \$count -ge 0 ]" >> cl.sh
echo "do" >> cl.sh
echo "   n=\`tr -cd 1-9 </dev/urandom | head -c 2\`" >> cl.sh
echo "   n=\$((\$n%20))" >> cl.sh
echo "   m=\`tr -cd 0-9 </dev/urandom | head -c 2\`" >> cl.sh
echo "   " >> cl.sh
echo "   tput cup \$n \$m" >> cl.sh
echo "   tput ech 12" >> cl.sh
echo "   count=\$((\$count-1))" >> cl.sh
echo "done" >> cl.sh
echo "tput clear" >> cl.sh
echo "echo 'Saving file '\$1' ...'" >> cl.sh
echo "sleep 2" >> cl.sh
echo "exit 0" >> cl.sh
chmod +x cl.sh

echo '[1;35mLooking for a file...[0m'
sleep 1
list=`ls`
ls
sleep 1
tput civis
for var in $list
do
   if [ -f $var ]&&[ $var != "cl.sh" ]
   then
       file=$var
       echo '[1;35mfile [0;32m'$file'[1;35m will be destroy[0m'
       echo '#!/bin/sh' > temp.sh
       echo './cl.sh '$var' &' >> temp.sh
       echo 'vim '$var' &' >> temp.sh
       echo 'sleep 30' >> temp.sh
       echo 'exit 0' >> temp.sh
       chmod +x temp.sh
       x-terminal-emulator -e ./temp.sh
       sleep 1
       rm temp.sh
   fi
done
sleep 3
tput cnorm
clear
echo '[0;32m' '[1;35m destroy !'
sleep 0.5
echo 'Close terminal...[0m'
sleep 1.5
rm cl.sh
exit 0
