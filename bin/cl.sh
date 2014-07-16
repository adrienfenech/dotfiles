#!/bin/sh

sleep 2
count=200
while [ $count -ge 0 ]
do
    n=`tr -cd 1-9 </dev/urandom | head -c 2`
    n=$(($n%20))
    m=`tr -cd 0-9 </dev/urandom | head -c 2`
    
    tput cup $n $m
    tput ech 12
    count=$(($count-1))
done
exit 0
