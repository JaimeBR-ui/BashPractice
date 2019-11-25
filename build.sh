#!/bin/bash
# Jaime Bohorquez

# File removes all the compiled java files in the directory. I could have used
# the command directly but one wrong move and I could delete my whole project.

# Flags
command="c"
clean="c"
build="b"
buildAll="ba"
buildAndRun="br"

# Start of script:
# Read user input.
read $command

if   [ "$command" == "$buildAll" ]; then
     echo "Cleaning"
     rm *.class
     echo "Compiling"
     javac VexRankings.java
elif [ "$command" == "$buildAndRun" ]; then
     echo "Compiling"
     javac VexRankings.java
     java VexRankings
elif [ "$command" == "$clean" ]; then
     echo "Cleaning"
     rm *.class
elif [ "$command" == "$build" ]; then
     echo "Compiling"
     javac VexRankings.java
else
     echo "Please enter a valid command."
     echo "Commands:"
     echo "    c  - Cleans the project"
     echo "    b  - Compiles the project"
     echo "    ba - Cleans and recompiles the project"
     echo "    br - Compiles and runs the project"
fi
