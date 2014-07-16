#!/bin/sh

#Variable Declaration

code_color=033
null='\'$code_color'[0m'
bold='\'$code_color'[1m'
flash='\'$code_color'[5m'

red='\'$code_color'[31m'
bla='\'$code_color'[30m'
red='\'$code_color'[31m'
gre='\'$code_color'[32m'
blu='\'$code_color'[33m'
yel='\'$code_color'[34m'
fus='\'$code_color'[35m'
cya='\'$code_color'[36m'
whi='\'$code_color'[37m'

bg_red='\'$code_color'[41m'
bg_bla='\'$code_color'[40m'
bg_red='\'$code_color'[41m'
bg_gre='\'$code_color'[42m'
bg_blu='\'$code_color'[43m'
bg_yel='\'$code_color'[44m'
bg_fus='\'$code_color'[45m'
bg_cya='\'$code_color'[46m'
bg_whi='\'$code_color'[47m'

temp=""
cond=""
exp1=""
exp2=""
check=""

#END Variable Declaration
# - - - - - - - - - - - - - - - - - - - - -
#Function

fun_if()
{
	echo  $cya"usage of add_if:"$null
	echo  "if "$bold"condition"$null" then "$bold"body1"$null" else "$bold"body2"$null
	echo  $bold"body2"$null$cya can be null, type "$null$bold"return button"$null$cya when expected"
	echo $bold"Condition"$null$cya "?"
	read cond
	echo $bold"Body1"$null$cya ":"$null$blod
	temp=""
	read temp
	while [ "$temp" != "" ]
	do
		exp1=$exp1"\n\t"$temp
		read temp
	done
	echo -n $cya"Is there an else body ? [y/n]: "$null$blod
	read check
	if [ $check = "y" ]
	then
		echo $bold"Body2"$null$cya ":"$null$blod
		temp=""
		read temp
		while [ "$temp" != "" ]
		do
			exp2=$exp2"\n\t"$temp
			read temp
		done
	fi
	echo `tac $1 -s '\n' | head -n 39` > $1
	#echo `cat $1 | head -n 39``echo $save_head``echo "if [ "$cond" ]"``echo "then"``echo $exp1``if [ $check != "y" ]; then echo "fi"; exit 0; fi``echo "else"``echo $exp2``echo $save_tail``cat $1 | tail -n +39` | tac -s '\n' | tac -s '\n' > $1
}

fun_while()
{
		echo "while_ok"
}

fun_for()
{
		echo "for_ok"
}

#END Function
# - - - - - - - - - - - - - - - - - - - - -
#Main

echo $#
if [ $# -ne 2 ]
then
	echo "usage: add [keyword] [file]"
	exit 0
fi

test -e $2
if [ $? -eq 1 ]; then ./init_script.sh $2; fi

case $1 in
	"while" )
		fun_while $2;;
	"for" )
		fun_for $2;;
	"if" )
		fun_if $2;;
	* )
		echo $1"_ok";;
esac

exit 0

#END Main
# - - - - - - - - - - - - - - - - - - - - -
#Comments



#END Comments
