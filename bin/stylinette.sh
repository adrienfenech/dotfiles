#This script use bash !

colorLigne='\033[0;32m'
color='\033[1;37m'
colorFd='\033[2;37m'
Ligne='\033[A'
colorUp='\033[1;31m'
colorUpEnd='\033[2;32m'
colorTitle='\033[1;92m'
colorNormal='\033[1;33m'
null='\033[0m'

target=$PWD
op='[\+\-\*/%]'

if [ $# -gt 0 ] && [ $1 != "all" ]; then
	target=$1
fi

fun_begin()
{
		echo $colorLigne'- - - - - - - - - - - -'$null
		echo '\n'
		echo $colorLigne' --->   '$1'   <---'$null
		echo $colorLigne' File : '$colorTitle$target'\033[0m'
		export GREP_OPTIONS='--color=auto --exclude=*.err' GREP_COLOR='1;31;47'	
}

fun_white_space()
{
		fun_begin 'space'
		grep -Eirn '[[:blank:]]$' $target	
}

fun_x_function()
{
		fun_begin $1
		grep -Eirn $1 $target
}


fun_parenthesis()
{
		fun_begin 'parenthesis'
		grep -Eirn '(\( )|( \)|([[:alnum:]]+\())' $target
}


fun_ope()
{
		fun_begin 'operator'
		grep -Eirn '(\w'$op')|('$op'\w)|(\w'$op'\w)|((  )+'$op')|('$op'(  )+)|((  )+'$op'(  )+)' $target
}

fun_80()
{
		fun_begin '80 columns'
		grep -r '.\{81,\}' $target
}

fun_line()
{
		fun_begin 'Empty Line'
		grep -Eirn '(^[ ]*$)+' $target
}

fun_dead()
{
		fun_begin 'Dead Code'
		grep -Eirn '(^[ ]*(//)|(/\*))+' $target
}

fun_init()
{
		echo $colorLigne'- - - - - - - - - - - -'$null
		echo $colorTitle' -->    STyLiNeTTe   <--'$null
		echo $colorLigne'- - - - - - - - - - - -'$null
}

fun_help()
{
		fun_begin 'Help'
		echo 'To check your file with the '$colorTitle'stylinette'$null', you can use this cmds :'
		echo 'TEST:'
		echo '-\033[1;33mall\033[0m-       ==> Check all rules of the '$colorTitle'stylinette'$null
		echo '-\033[1;33mall_export\033[0m-==> Check all rules of the '$colorTitle'stylinette'$null' and export into test_results'
		echo '-\033[1;33mspace\033[0m-     ==> Check the trailling white space'
		echo '-\033[1;33mpar\033[0m-       ==> Check the parenthesis'
		echo '-\033[1;33mope\033[0m-       ==> Check the operator'
		echo '-\033[1;33m80\033[0m-        ==> Check the 80 columns'
		echo '-\033[1;33mline\033[0m-      ==> Check the Empty line'
		echo '-\033[1;33mdead\033[0m-      ==> Check dead code'
		echo '-\033[1;33m[pattern]\033[0m- ==> Check if the pattern exists'
		echo 'OPTION:'
		echo '-\033[1;33mhelp\033[0m-      ==> Show the help'
		echo '-\033[1;33mls\033[0m-        ==> Show the current directory'
		echo '-\033[1;33mfile\033[0m-      ==> Use to change the file/directory do check'
		echo '-\033[1;33mclear\033[0m-     ==> Clear the '$colorTitle'stylinette'$null
		echo '-\033[1;33mexit\033[0m-      ==> Quit the '$colorTitle'stylinette'$null
}

fun_help_file()
{
		fun_begin 'Help'
		echo 'To check your file with the '$colorTitle'stylinette'$null', you can use this cmds :'
		echo '-\033[1;33mhelp\033[0m-      ==> Show the help of changing file'
		echo '-\033[1;33mls\033[0m-        ==> Show the current directory'
		echo '-\033[1;33mdir\033[0m-       ==> Current directory will be check'
		echo '-\033[1;33m[file]\033[0m-    ==> file will be check'
		echo '-\033[1;33mclear\033[0m-     ==> Clear the '$colorTitle'stylinette'$null
}

fun_all()
{
	clear;
	fun_init;
	sleep 0.2;
	fun_white_space;
	sleep 0.2;
	fun_parenthesis;
	sleep 0.2;
	fun_ope;
	sleep 0.2;
	fun_80;
	sleep 0.2;
	fun_line;
	sleep 0.2;
	fun_dead;
}

fun_all_export()
{
	fun_init;
	mkdir test_results;
	echo $colorNormal' Directory & files creation:'$null;
	fun_white_space > test_results/white_space.err;
	if [ $? -eq 0 ]; then
	echo $colorNormal' white_space.err... '$colorLigne'DONE'$null;
	else echo $colorNormal' white_space.err... '$colorUp'FAIL'$null; fi
	fun_parenthesis > test_results/parenthesis.err;
	if [ $? -eq 0 ]; then
	echo $colorNormal' parenthesis.err... '$colorLigne'DONE'$null;
	else echo $colorNormal' parenthesis.err... '$colorUp'FAIL'$null; fi
	fun_ope > test_results/operator.err;
	if [ $? -eq 0 ]; then
	echo $colorNormal' operator.err...    '$colorLigne'DONE'$null;
	else echo $colorNormal' operator.err...    '$colorUp'FAIL'$null; fi
	fun_80 > test_results/80_columns.err;
	if [ $? -eq 0 ]; then
	echo $colorNormal' 80_columns.err...  '$colorLigne'DONE'$null;
	else echo $colorNormal' 80_columns.err...  '$colorUp'FAIL'$null; fi
	fun_line > test_results/white_line.err;
	if [ $? -eq 0 ]; then
	echo $colorNormal' white_line.err...  '$colorLigne'DONE'$null;
	else echo $colorNormal' white_line.err...  '$colorUp'FAIL'$null; fi
	fun_dead > test_results/dead_code.err;
	if [ $? -eq 0 ]; then
	echo $colorNormal' dead_code.err...   '$colorLigne'DONE'$null;
	else echo $colorNormal' dead_code.err...  '$colorUp'FAIL'$null; fi
}

fun_file()
{
	while [ 1 ]
	do
		echo '\033[0;36m Current directory... : \033[0m'
		ls;
		echo -n '\033[0;36m File to check... [help]: \033[0m'
		read cmd2;
		case $cmd2 in
			"dir" )
				target=$PWD;
				break;;
			"help" )
				fun_help_file;;
			"ls" )
				ls;;
			"clear" )
				clear
				fun_init;;
			* )
				target=$cmd2;
				break;;
		esac
	done
	echo $colorTitle $cmd2 $colorLigne'is the current file/directory to check'$null
}

clear
fun_init
while [ 1 ]
do
	echo -n '\033[0;36m Next action... [help]: \033[0m'
	read cmd;
	case $cmd in
		"space" )
			fun_white_space;;
		"par" )
			fun_parenthesis;;
		"ope" )
			fun_ope;;
		"80" )
			fun_80;;
		"line" )
			fun_line;;
		"dead" )
			fun_dead;;
		"exit" )
			break;;
		"exit -r" )
			exit 42;;
		"clear" )
			clear
			fun_init;;
		"all" )
			clear
			fun_all;;
		"all_export" )
			clear
			fun_all_export;;
		"ls" )
			ls;;
		"file" )
			fun_file;;
		"help" )
			fun_help;;
		* )
			fun_x_function $cmd;;
	esac
	echo $colorLigne'- - - - - - - - - - - -'$null
done
echo $colorTitle'stylinette'$colorLigne' shutting down...'$null
exit 0
