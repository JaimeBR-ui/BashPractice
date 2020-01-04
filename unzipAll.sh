#!bin/bash

# Jaime Bohorquez
# Script to unzip all files in a directory

# Unzip must be installed. To install use:
# brew install unzip or for linux apt-get install unzip

# Check if the new storage directory exists.

if [ -z "$(ls zips)"]; then
	mkdir zips # make a directory where to store the zip files
fi

# Loop through every file in the directory.

for file in *; do

	# Check that file has the correct extension.
	if [ ${file: -4} == ".zip" ]; then	
		unzip $file -d ./	# Unzip the file.
		mv $file ./zips 	# Move zip to zips folder.
	fi
done

# Check that the zips directory is empty.
if [ -z "$(ls -A ./zips)" ]; then
	rm -r zips 			# Deletes empty directory.
fi
