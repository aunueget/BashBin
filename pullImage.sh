#!/bin/bash

echo "hello world"

dir="img2018"              # Remove all dots.

for f in *.jpg                 # no need to use ls.
do
    filename=${f##*/}          # Use the last part of a path.
    extension=${f##*.}         # Remove up to the last dot.
    filename=${filename%.*}    # Remove from the last dot.
    echo "$filename $dir"
	
	img_date=${filename:8:8}
	img_time=${filename:16:4}
	echo $img_date
	echo $img_time
	test_date=$(date +%u -d $img_date )
	echo $test_date
	if [[ $test_date -eq 5 ]] ; then
		echo 'Its friday'
		if [[ $((10#$img_time)) -gt 1800 ]] ; then
			echo "Friday Carnite image"
			if [[ -d $dir ]]; then     # If the directory exists
				mv "$filename.$extension" "$dir"/ # Move file there.
			fi
		fi
	elif [[ $test_date -eq 6 ]]; then
		echo "its Saturday"
		if [[ $((10#$img_time)) -lt 300 ]] ; then
			echo "Saturday CarMorning image"
			if [[ -d $dir ]]; then     # If the directory exists
				mv "$filename.$extension" "$dir"/ # Move file there.
			fi
		fi
	else
		echo "not carnite"
	fi

done