#!/bin/sh

## This is a small script to N-save

str=""
path=~/Documents/NOTES/divers

for chain in $@
do
	str=$str' '$chain
done

echo $str >> $path
echo "" >> $path
echo '\033[1;32mN-save\033[0m of \033[34m'$str'\033[0m.'
