#!bin/bash
# Jaime Bohorquez

# Script updates VexU rankings every hour.

#  Shell check.

if [ "$BASH" != "/bin/bash" ]; then
  echo ""
  echo "Please use bash to run this script."
  echo ""
  exit
fi

if [ -z "$BASH_VERSION" ]; then
  echo ""
  echo "Please use bash to run this script."
  echo ""
  exit
fi

while [[ 1 == 1 ]]; do

     cd ~/Desktop/VexRankings
     make run > ~/Desktop/code/JaimeBR-ui.github.io/VexRankings/rankings.txt

     cd ~/Desktop/code/JaimeBR-ui.github.io/
     echo "============================================" >> ./VexRankings/rankings.txt
     echo "Last Updated on $(date)" >> ./VexRankings/rankings.txt
     echo "============================================" >> ./VexRankings/rankings.txt

     # Push updates to repository.
     git add ./VexRankings/rankings.txt
     git commit -m "updating data"
     git push -u origin master

     # Put process to sleep for an hour.
     sleep 3600

done
