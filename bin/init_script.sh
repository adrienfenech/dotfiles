#!/bin/sh

if [ $# -eq 0 ]
then
	echo "Usage : ./init_script [script_name]"
	exit 0
fi
echo $1
file=$1
echo "#!/bin/sh" >> $file
echo "" >> $file
echo "#Variable Declaration" >> $file
echo "" >> $file
echo code_color=033 >> $file
echo "null='\\'\$code_color'[0m'" >> $file
echo "bold='\\'\$code_color'[1m'" >> $file
echo "flash='\\'\$code_color'[5m'" >> $file
echo "Special type ==> DONE"
echo "" >> $file
echo "red='\\'\$code_color'[31m'" >> $file
echo "bla='\\'\$code_color'[30m'" >> $file
echo "red='\\'\$code_color'[31m'" >> $file
echo "gre='\\'\$code_color'[32m'" >> $file
echo "blu='\\'\$code_color'[33m'" >> $file
echo "yel='\\'\$code_color'[34m'" >> $file
echo "fus='\\'\$code_color'[35m'" >> $file
echo "cya='\\'\$code_color'[36m'" >> $file
echo "whi='\\'\$code_color'[37m'" >> $file
echo "Color ==> DONE"
echo "" >> $file
echo "bg_red='\\'\$code_color'[41m'" >> $file
echo "bg_bla='\\'\$code_color'[40m'" >> $file
echo "bg_red='\\'\$code_color'[41m'" >> $file
echo "bg_gre='\\'\$code_color'[42m'" >> $file
echo "bg_blu='\\'\$code_color'[43m'" >> $file
echo "bg_yel='\\'\$code_color'[44m'" >> $file
echo "bg_fus='\\'\$code_color'[45m'" >> $file
echo "bg_cya='\\'\$code_color'[46m'" >> $file
echo "bg_whi='\\'\$code_color'[47m'" >> $file
echo "Background color ==> DONE"
echo "" >> $file
echo "#END Variable Declaration" >> $file
echo "# - - - - - - - - - - - - - - - - - - - - -" >> $file
echo "#Function" >> $file
echo "" >> $file
echo "" >> $file
echo "" >> $file
echo "#END Function" >> $file
echo "# - - - - - - - - - - - - - - - - - - - - -" >> $file
echo "#Main" >> $file
echo "" >> $file
echo "" >> $file
echo "exit 0" >> $file
echo "" >> $file
echo "#END Main" >> $file
echo "# - - - - - - - - - - - - - - - - - - - - -" >> $file
echo "#Comments" >> $file
echo "" >> $file
echo "" >> $file
echo "" >> $file
echo "#END Comments" >> $file
chmod +x $file
