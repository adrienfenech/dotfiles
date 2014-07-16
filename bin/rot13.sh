#!/bin/sh
#cat $@ | tr 'a-zA-Z' 'n-za-mN-ZA-M'
if [ $# -eq 0 ]
then
    cat $0 >> $0'_copy'
fi

last_line=`cat $0 | tail --lines=1`
sed -i '/rot13/ d' $0
echo 'echo This is the   first' >> $0
echo $last_line >> $0
sleep 3
./rot13.sh 1
