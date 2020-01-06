#!/bin/bash

# Jaime Bohorquez
# Does an emergency push on all the repos.

cd ~/Desktop/Code

for dir in *; do

  if [ -d $dir ]; then
  {
    cd $dir
    git add -A
    git commit -m "emergency push"
    git push -u origin master
    cd ..
  }
  fi
done
