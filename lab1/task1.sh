#!/bin/bash

verbose=0
output_file=""
dir="."

while getopts "vf:d:" opt; do
	case "$opt" in
	v)	verbose=1 ;;
	f)	output_file=$OPTARG ;;
	d)	dir=$OPTARG ;;
    esac
done


if [ -z $output_file ]
then
	echo "Output file name is not specified!"
	exit	
fi

if [ $verbose -eq 0 ]
then
	find `readlink -f $dir` > $output_file
else
	find `readlink -f $dir` | tee  $output_file
	echo "zipping"
fi

zip "$output_file.zip" "$output_file" -q
rm $output_file

echo "Please insert Flash drive and press Enter"

read
if [ $verbose -ne 0 ]
then
	echo "moving to the flash card"
fi

readarray -t drivers < <(ls -d -1 /media/$USERNAME/*)

select driver in "${drivers[@]}"
do
	if [ -z "$driver" ]
	then
		continue
	fi
	mv "$output_file.zip" "$driver/$output_file.zip"
	break
done
