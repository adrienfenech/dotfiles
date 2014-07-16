#!/bin/sh

colorLigne='\033[0;32m'
color='\033[1;37m'
colorFd='\033[2;37m'
Ligne='\033[A'
colorErrG='\033[1;31m'
colorErr='\033[2;31m'
colorUpEnd='\033[2;32m'
colorTitle='\033[1;92m'
colorNormal='\033[1;33m'
colored='\033[1;34m'
null='\033[0m'

type=""
name=""
name_maj=""
lasttype=0

in0=""
in1=""
in2=""
in3=""
in4=""
in5=""
in6=""
in7=""
in8=""
in9=""

at0=""
at1=""
at2=""
at3=""
at4=""
at5=""
at6=""
at7=""
at8=""
at9=""

dyn=0
static=0
exe=0
rule0=""
rule1=""
rule2=""
rule3=""
rule4=""
rule5=""
rule6=""
rule7=""
rule8=""
rule9=""

fun_reset_include()
{
	in0=""
	in1=""
	in2=""
	in3=""
	in4=""
	in5=""
	in6=""
	in7=""
	in8=""
	in9=""
}

fun_reset_attribute()
{
	at0=""
	at1=""
	at2=""
	at3=""
	at4=""
	at5=""
	at6=""
	at7=""
	at8=""
	at9=""
}

fun_reset_rule()
{
	exe=0
	static=0
	exe=0
	rule0=""
	rule1=""
	rule2=""
	rule3=""
	rule4=""
	rule5=""
	rule6=""
	rule7=""
	rule8=""
	rule9=""
}

echo $colorLigne'Welcome on the module of file creation : '$colorTitle'Create Module'$null

## CREATION
fun_create_makefile()
{
	file=$name
	echo $colored'Creation of '$colorErrG$file$colored'... '$colorTitle'DONE'$null
	echo "CXX=g++" >> $file
	echo "CXXFLAGS= -Wall -Wextra -Werror -pedantic -std=c++11" >> $file
	echo "EXEC=exec" >> $file	
	echo "DYN=libdyn" >> $file	
	echo "STA=libstatic" >> $file
	echo "FILES=" >> $file
	echo "DIR=src/" >> $file
	echo "SRC=\$(addprefix \$(DIR), \$(FILES))" >> $file
	echo "OBJS=\$(SRC:.cc=.o)" >> $file
	echo "OBJ_FPIC=\$(src:.cc=.o.fpic)" >> $file
	echo "" >> $file
	echo "all: \$(EXEC) \$(DYN)" >> $file
	echo "" >> $file
	echo "\$(DYN):\$(OBJ_FPIC)" >> $file
	echo "\t\$(CXX) --shared \$^ -o \$@" >> $file
	echo "" >> $file
	echo "\$(EXEC):" >> $file
	echo "\t\$(CXX) \$(CXXFLAGS) \$(SRC) -o \$@" >> $file
	echo "" >> $file
	echo "%.o.fpic:CXXFLAGS += -fPIC" >> $file
	echo "" >> $file
	echo "%.o.fpic:%.cc" >> $file
	echo "\t\$(COMPILE.cc) \$(CXXFLAGS) \$(OUTPUT_OPTION) \$<" >> $file
	echo "" >> $file
	echo "clean:" >> $file
	echo "\t\$(RM) \$(EXEC) \$(OBJS) \$(OBJ_FPIC)" >> $file
}

fun_echo_method_G_S()
{
name_maj=`echo $name | head -c1 | tr 'a-z' 'A-Z'``echo $name | tail -c +2`
if [ $1 != "" ]
then
	echo "// Get Set for the attribute " $2 >> $file
	echo $1" "$name_maj"::Get_"$2"()" >> $file
	echo "{" >> $file
	echo "\treturn "$2";" >> $file
	echo "}" >> $file
	echo "" >> $file
	echo "void" $name_maj"::Set_"$2"("$1 $2")" >> $file
	echo "{" >> $file
	echo "\tthis."$2 "=" $2";" >> $file
	echo "}" >> $file
	echo "" >> $file
fi
}

fun_create_method()
{
name_maj=`echo $name | head -c1 | tr 'a-z' 'A-Z'``echo $name | tail -c +2`
	echo $name_maj"::"$name"()" >> $file
	echo "{" >> $file
	echo "}" >> $file
	echo "" >> $file
	echo $name_maj"::~"$name"()" >> $file
	echo "{" >> $file
	echo "}" >> $file
	echo "" >> $file
	fun_echo_method_G_S $at0
	fun_echo_method_G_S $at1
	fun_echo_method_G_S $at2
	fun_echo_method_G_S $at3
	fun_echo_method_G_S $at4
	fun_echo_method_G_S $at6
	fun_echo_method_G_S $at7
	fun_echo_method_G_S $at8
	fun_echo_method_G_S $at9
}

fun_echo_attribute()
{
	if [ "$at0" != "" ]; then echo "\t"$at0';' >> $file; fi
	if [ "$at1" != "" ]; then echo "\t"$at1';' >> $file; fi
	if [ "$at2" != "" ]; then echo "\t"$at2';' >> $file; fi
	if [ "$at3" != "" ]; then echo "\t"$at3';' >> $file; fi
	if [ "$at4" != "" ]; then echo "\t"$at4';' >> $file; fi
	if [ "$at5" != "" ]; then echo "\t"$at5';' >> $file; fi
	if [ "$at6" != "" ]; then echo "\t"$at6';' >> $file; fi
	if [ "$at7" != "" ]; then echo "\t"$at7';' >> $file; fi
	if [ "$at8" != "" ]; then echo "\t"$at8';' >> $file; fi
	if [ "$at9" != "" ]; then echo "\t"$at9';' >> $file; fi
	echo "" >> $file
}

fun_echo_include()
{
	space=""
	if [ $is_header -eq 1 ]; then space=" "; fi
	if [ "$in0" != "" ]; then echo "#"$space"include <"$in0'>' >> $file; fi
	if [ "$in1" != "" ]; then echo "#"$space"include <"$in1'>' >> $file; fi
	if [ "$in2" != "" ]; then echo "#"$space"include <"$in2'>' >> $file; fi
	if [ "$in3" != "" ]; then echo "#"$space"include <"$in3'>' >> $file; fi
	if [ "$in4" != "" ]; then echo "#"$space"include <"$in4'>' >> $file; fi
	if [ "$in5" != "" ]; then echo "#"$space"include <"$in5'>' >> $file; fi
	if [ "$in6" != "" ]; then echo "#"$space"include <"$in6'>' >> $file; fi
	if [ "$in7" != "" ]; then echo "#"$space"include <"$in7'>' >> $file; fi
	if [ "$in8" != "" ]; then echo "#"$space"include <"$in8'>' >> $file; fi
	if [ "$in9" != "" ]; then echo "#"$space"include <"$in9'>' >> $file; fi
	echo "" >> $file
	if [ $lasttype -eq 1 ]; then fun_create_method; fi
}

fun_create_class()
{
name_maj=`echo $name | head -c1 | tr 'a-z' 'A-Z'``echo $name | tail -c +2`
	echo "class "$name_maj >> $file
	echo "{" >> $file
	echo "public:" >> $file
	echo "\t"$name_maj"();" >> $file
	echo "\t~"$name_maj"();" >> $file
	echo "" >> $file
	echo "private:" >> $file
	fun_echo_attribute
	echo "protected:" >> $file
	echo "}" >> $file
}

fun_create()
{
	file=$name"."$type
	if [ $is_header -eq 1 ]
	then
		upper=$name
		val_name=$(echo $upper | tr '[a-z]' '[A-Z]')
		upper=$type
		val_type=$(echo $upper | tr '[a-z]' '[A-Z]')
		upper=$val_name"_"$val_type
		echo "#ifndef "$upper  >> $file
		echo "# define "$upper >> $file
		echo "" >> $file
		fun_echo_include
		echo "" >> $file
		fun_create_class
		echo "" >> $file
		echo "" >> $file
		echo "#endif /* !"$upper" */" >> $file
		echo $colored'Creation of '$colorErrG$file$colored'... '$colorTitle'DONE'$null
		if [ "$type" != "hxx" ]
		then
			if [ "$type" = "hh" ]; then
				echo -n $colored'Do you want to create the associated '$colorErrG$name".cc"$colored " file ? [y/*] "$null
			elif [ "$type" = "h" ]; then
				echo -n $colored'Do you want to create the associated '$colorErrG$name".c"$colored " file ? [y/*] "$null
			fi
			read tmp
			case $tmp in
				"y" )
					if [ "$type" = "hh" ]; then
						type="cc"
					elif [ "$type" = "h" ]; then
						type="c"
					fi
					fun_reset_include
					in0=$file
					is_header=0
					lasttype=1
					fun_create;;
				* )
					break;;
			esac
		fi
	else
		fun_echo_include
	fi
}

## INCLUDE
fun_add_attribute()
{
	if [ "$at0" = "" ]; then
		at0=$1' '$2
	elif [ "$at1" = "" ]; then
		at1=$1' '$2
	elif [ "$at2" = "" ]; then
		at2=$1' '$2
	elif [ "$at3" = "" ]; then
		at3=$1' '$2
	elif [ "$at4" = "" ]; then
		at4=$1' '$2
	elif [ "$at5" = "" ]; then
	        at5=$1' '$2
	elif [ "$at6" = "" ]; then
	        at6=$1' '$2
	elif [ "$at7" = "" ]; then
	        at7=$1' '$2
	elif [ "$at8" = "" ]; then
		at8=$1' '$2
	elif [ "$at9" = "" ]; then
		at9=$1' '$2
	fi
}
fun_add_include()
{
	if [ "$in0" = "" ]; then
		in0=$1
	elif [ "$in1" = "" ]; then
		in1=$1
	elif [ "$in2" = "" ]; then
		in2=$1
	elif [ "$in3" = "" ]; then
		in3=$1
	elif [ "$in4" = "" ]; then
		in4=$1
	elif [ "$in5" = "" ]; then
	        in5=$1
	elif [ "$in6" = "" ]; then
	        in6=$1
	elif [ "$in7" = "" ]; then
	        in7=$1
	elif [ "$in8" = "" ]; then
		in8=$1
	elif [ "$in9" = "" ]; then
		in9=$1
	fi
}

fun_help_include()
{
	echo $colorLigne'In this version of '$colorTitle'Create Module'$colorLigne', you can use the command :'$null
	echo $colored'-'$colorNormal'[include]'$colored'-     => Include in document to create (max 10)'$null
	echo $colored'-'$colorNormal'help'$colored'-          => Show this help'$null
	echo $colored'-'$colorNormal'clear'$colored'-         => Clear the screen'$null
	echo $colored'-'$colorNormal'exit'$colored'-          => Shutdown the '$colorTitle'speCtre'$colored' module'$null
}

fun_include()
{
	while [ 1 ]
	do
		echo -n $colorNormal'Next '$colored'include'$colorNormal' to add in file [help/done] :'$colored
		read cmd
		case $cmd in
			"clear" )
				clear;;
			"done" )
				fun_create
				break;;
			"exit" )
				break;;
			"help" )
				fun_help_include;;
			* )
				fun_add_include $cmd;;
		esac
	done
}

## NAME
fun_help_name()
{
	echo $colorLigne'In this version of '$colorTitle'Create Module'$colorLigne', you can use the command :'$null
	echo $colored'-'$colorNormal'[name]'$colored'-        => Name of document to create'$null
	echo $colored'-'$colorNormal'help'$colored'-          => Show this help'$null
	echo $colored'-'$colorNormal'clear'$colored'-         => Clear the screen'$null
	echo $colored'-'$colorNormal'exit'$colored'-          => Shutdown the '$colorTitle'speCtre'$colored' module'$null
}

fun_name()
{
	while [ 1 ]
	do
		echo -n $colored'Name'$colorNormal' of file to generate [help] :'$colored
		read cmd
		case $cmd in
			"clear" )
				clear;;
			"exit" )
				break;;
			"help" )
				fun_help_name;;
			* )
				name=$cmd
				fun_include
				break;;
		esac
	done
}

## MAKEFILE
fun_add_rule()
{
	if [ "$rule0" = "" ]; then
		rule0=$1
	elif [ "$rule1" = "" ]; then
		rule1=$1
	elif [ "$rule2" = "" ]; then
		rule2=$1
	elif [ "$rule3" = "" ]; then
		rule3=$1
	elif [ "$rule4" = "" ]; then
		rule4=$1
	elif [ "$rule5" = "" ]; then
	        rule5=$1
	elif [ "$rule6" = "" ]; then
	        rule6=$1
	elif [ "$rule7" = "" ]; then
	        rule7=$1
	elif [ "$rule8" = "" ]; then
		rule8=$1
	elif [ "$rule9" = "" ]; then
		rule9=$1
	fi
}

fun_help_makefile()
{
	echo $colorLigne'In this version of '$colorTitle'Create Module'$colorLigne', you can use the command :'$null
	echo $colored'-'$colorNormal'dyn'$colored'-           => Add a rule to create Dynamic lib'$null
	echo $colored'-'$colorNormal'static'$colored'-        => Add a rule to create Static lib'$null
	echo $colored'-'$colorNormal'exe'$colored'-           => Add a rule to create an exec file'$null
	echo $colored'-'$colorNormal'[rule]'$colored'-        => Create a new rule which name is [rule]'$null
	echo $colored'-'$colorNormal'help'$colored'-          => Show this help'$null
	echo $colored'-'$colorNormal'clear'$colored'-         => Clear the screen'$null
	echo $colored'-'$colorNormal'exit'$colored'-          => Shutdown the '$colorTitle'speCtre'$colored' module'$null
}

fun_makefile()
{
	while [ 1 ]
	do
		echo -n $colored'Rules'$colorNormal' of the makefile [help/done] :'$colored
		read cmd
		case $cmd in
			"clear" )
				clear;;
			"exit" )
				break;;
			"help" )
				fun_help_makefile;;
			"dyn" )
				dyn=1;;
			"static" )
				static=1;;
			"exe" )
				exe=1;;
			"done" )
				fun_create_makefile
				break;;
			* )
				fun_add_rule $cmd;;
		esac
	done
}

## CLASS
fun_create_arch()
{
	fun_reset_attribute
	while [ 1 ]
	do
		echo -n $colored'Attributes'$colorNormal' to add {type name} [Attr/done] :'$colored
		read cmd
		case $cmd in
			"done" )
				break;;
			* )
				fun_add_attribute $cmd;;
		esac
	done
	echo $colored'Creation of '$colorErrG$2$colored' class...'
	fun_reset_include
	temp=$1
	name=$2
	type='hh'
	file=$2'.'$type
	is_header=1
	upper=$2
	for toto in $*
	do
		if [ $toto = $temp ]||[ $toto = $name ]; then
			echo -n ''
		else
			fun_add_include $toto
		fi
	done
	val_name=$(echo $upper | tr '[a-z]' '[A-Z]')
	upper=$type
	val_type=$(echo $upper | tr '[a-z]' '[A-Z]')
	upper=$val_name"_"$val_type
	echo "#ifndef "$upper  >> $file
	echo "# define "$upper >> $file
	echo "" >> $file
	fun_echo_include
	echo "" >> $file
	fun_create_class
	echo "" >> $file
	echo "" >> $file
	echo "#endif /* !"$upper" */" >> $file
	fun_reset_include
	is_header=0
	fun_add_include $file
	type='cc'
	file=$2'.'$type
	fun_echo_include
	fun_create_method
}

## ToDo

fun_create_todo()
{
	count_section=0
	count_todo=0
	echo -n $colorErrG'Name'$colorNormal' of the TODO'$colorNormal' file :'$null
	read cmd;
	name=$cmd;
	file_name='TODO_'$name
	echo "#!/bin/sh" >> $file_name
	
	echo nb=033 >> $file_name
	echo "colorLigne='\\'\$nb'[0;32m'" >> $file_name
	echo "color='\\'\$nb'[1;37m'" >> $file_name
	echo "colorFd='\\'\$nb'[2;37m'" >> $file_name
	echo "Ligne='\\'\$nb'[A'" >> $file_name
	echo "colorErrG='\\'\$nb'[1;31m'" >> $file_name
	echo "colorErr='\\'\$nb'[2;31m'" >> $file_name
	echo "colorUpEnd='\\'\$nb'[2;32m'" >> $file_name
	echo "colorTitle='\\'\$nb'[1;92m'" >> $file_name
	echo "colorNormal='\\'\$nb'[1;33m'" >> $file_name
	echo "colored='\\'\$nb'[1;34m'" >> $file_name
	echo "null='\\'\$nb'[0m'" >> $file_name

	echo "" >> $file_name
	echo "echo \$colorNormal'This is an interactif TODO for '\$colorTitle'"$name"'\$colorNormal' project.'\$null" >> $file_name
	while [ 1 ]
	do
		echo -n $colorNormal'Name of the next '$colorErrG'Section'$colorNormal' of TODO '$colorTitle$name$colorNormal' [section/done]: '$null
		read section;
		if [ $section = "done" ]; then break; fi
		count_section=$(($count_section + 1))
		echo "" >> $file_name
		echo "echo \$colorNormal'Section '\$colored'"$section"'\$colorNormal' :'\$null" >> $file_name
		while [ 1 ]
		do
			echo -n $colorNormal'Name of the next '$colorErrG'Todo'$colorNormal' of section '$colorTitle$section$colorNormal' [Todo/done]: '$null
			read todo
			if [ $todo = "done" ]; then break; fi
			count_todo=$(($count_todo + 1))
			echo "" >> $file_name
			echo "echo \$colorNormal'\\tTodo '\$colorTitle'"$todo"'\$colorNormal' : '\$colorFd'TODO'\$null" >> $file_name
		done
	done
	chmod +x $file_name
}

## TYPE
fun_help_type()
{
	echo $colorLigne'In this version of '$colorTitle'Create Module'$colorLigne', you can use the command :'$null
	echo $colored'-'$colorNormal'[type]'$colored'-        => Type of document to create'$null
	echo $colored'-'$colorNormal'cd'$colored'-            => Change the current directory'$null
	echo $colored'-'$colorNormal'ls'$colored'-            => Show the current directory'$null
	echo $colored'-'$colorNormal'help'$colored'-          => Show this help'$null
	echo $colored'-'$colorNormal'clear'$colored'-         => Clear the screen'$null
	echo $colored'-'$colorNormal'exit'$colored'-          => Shutdown the '$colorTitle'speCtre'$colored' module'$null
	echo $colored'Type of file known: ['$colorNormal'cc'$colored']'$null
	echo $colored'                    ['$colorNormal'hh'$colored']'$null
	echo $colored'                    ['$colorNormal'hxx'$colored']'$null
	echo $colored'                    ['$colorNormal'c'$colored']'$null
	echo $colored'                    ['$colorNormal'h'$colored']'$null
	echo $colored'                    ['$colorNormal'Makefile'$colored']'$null
	echo $colored'                    ['$colorNormal'TODO'$colored']'$null
	echo $colored'                    ['$colorNormal'Class'$colored']['$colorNormal'class_name'$colored']['$colorNormal'inlude_1'$colored']...'$null
}

fun_type()
{
	while [ 1 ]
	do
		echo -n $colored'Type'$colorNormal' of file to generate [help] :'$colored
		read cmd
		case $cmd in
			"TODO" )
				fun_create_todo;;
			"Class"* )
				fun_create_arch $cmd;;
			"h" | "hh" | "hxx" )
				type=$cmd
				is_header=1
				fun_name
				fun_reset_include;;
			"c" | "cc" )
				type=$cmd
				is_header=0
				fun_name
				fun_reset_include;;
			"ls"* | "cd"* )
				$cmd;;
			"Makefile" )
				type=""
				name=Makefile
				fun_makefile;;
			"clear" )
				clear;;
			"exit" )
				break;;
			"exit -r" )
				exit 42;;
			"help" )
				fun_help_type;;
			* )
				echo $colorErrG'File type not found, try again.'$null;;
		esac
	done
	echo 'Thank you to use the '$colorTitle'Create Module'$null
}

fun_type
exit 0;
