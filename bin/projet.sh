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

authors="AUTHORS"
todo="TODO"
readme="README"
makefile="Makefile"
src="src"
check="check"

## CREATION
fun_create_makefile()
{
	file=$makefile
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

echo "* fenech_a" >> $authors
echo $colored'Creation of '$colorErrG$authors$colored'... '$colorTitle'DONE'$null
echo "TODO" >> $todo
echo $colored'Creation of '$colorErrG$todo$colored'... '$colorTitle'DONE'$null
echo "readme" >> $readme
echo $colored'Creation of '$colorErrG$readme$colored'... '$colorTitle'DONE'$null
mkdir $src
echo $colored'Creation of '$colorErrG$src$colored'... '$colorTitle'DONE'$null
mkdir $check
echo $colored'Creation of '$colorErrG$check$colored'... '$colorTitle'DONE'$null
fun_create_makefile
cd $src
create
