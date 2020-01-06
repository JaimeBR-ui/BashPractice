#!/bin/bash

# Jaime Bohorquez

# Sample function declaration and use.
# Definition comes before usage, parameters are not stated within
# parantheses. 

function welcome_user {
  echo "Welcome back!"
}

say_goodbye () {
  if [ -z $1 ];
  then
    echo "Goodbye!"
  else
    echo "Goodbye" $1
  fi
}

# Calls function.
welcome_user

# Calls function with no parameters.
say_goodbye

# calls function again but with a parameter.
say_goodbye jaime
