#!/bin/bash


while read -r -d '' -u 9 file
do
	file_size=`stat --printf="%s" $file`
	if [ $file_size -gt 102400 ]
	then
		echo "`du -h $file`:"
		select opt in "zip" "remove" "Save"
		do
			case $opt in
				"zip")
					zip "$file.zip" $file -q ;;
				"remove")
					rm $file ;; 
				"Save") ;;
			esac
			break
		done
	fi
done 9< <( find /home/$USERNAME/ -type f -print0 2> /dev/null )
