#!/bin/sh

if [ $# -ne 1 ]
then
    echo "Usage : ./java_piscine [day]"
    exit 0
fi

file="Day"$1

mkdir $file
cd $file
touch "Cours"
touch "Code"
echo "Goals of the day "$1 > "Readme_day_"$1
echo "" >> "Readme_day"$1

exit 0
