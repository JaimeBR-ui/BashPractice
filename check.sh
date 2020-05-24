#!/bin/bash

# Jaime Bohorquez

# Programmed using Atom + iTerm2 on Mac OS.

# Java submission system for past UCF Local Programming contest data.

# This script checks answers from the solutions and data from
# https://lpc.ucfprogrammingteam.org/index.php/past-contests/past-problem-sets

# $1 contains the name of the Java file with no extension

cd data

# Let's check if the file was named correctly.
flag=0;
for file in *; do
	if [ $file == $1 ]; then
		flag=1
		break;
	fi
done

# Exit if the name is invalid.
if [ $flag == 0 ]; then
	echo invalid filename
	exit
fi

cd ..

# Let's compile our program!
responce=$(javac $1.java)

# If we don't get a clean compilation, we treat it as a compile error.
if [[ $responce != "" ]]; then
	echo $responce
	exit
fi

# Move all the binaries to the data folder.
mv *.class ./data/$1/

# Move ourselves to that folder.
cd ./data/$1/

# Create our holder file.
touch output.txt

# Reset our flag
flag=0;
for file in *; do
	# Only process input files.
	if [ ${file: -3} == ".in" ]; then

		cat $file | java $1 > output.txt

		result=$(diff ${file%.in}.out output.txt)
		if [[ $result != "" ]]; then
			flag=1;
			echo Wrong output on $file
			echo output
			cat output.txt
			echo actual
			cat ${file%.in}.out
		fi
	fi
done

# Chech that we passed all the tests.
if [ $flag == 0 ]; then
	echo Submission Accepted
fi

# Remove our temporary file.
rm output.txt

# Remove our binaries.
rm *.class

# Go back to root.
cd ../..

# We're done!
exit
