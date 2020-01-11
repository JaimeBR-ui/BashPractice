#!/bin/bash

# Jaime Bohorquez

# Pulls all changes from master.

cd ~/Desktop/Code

for directory in *; do
  
  if [ -d $directory ]; then
    cd $directory
    git pull
    cd ..
  fi
done
