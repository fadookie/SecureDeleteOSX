#!/bin/bash

# Parse out unwanted -p flag that may get sent by Platypus/Carbon
while getopts "p::" Option
do
  case $Option in
    p     ) echo "ignoring option -p-\
                  with argument \"$OPTARG\"   [OPTIND=${OPTIND}]";;
    #  Note that option 'p' must have an associated argument,
    #+ otherwise it falls through to the default.
    *     ) echo "Unimplemented option chosen.";;   # Default.
  esac
done

#  Decrements the argument pointer so it points to next argument.
#  $1 now references the first non-option item supplied on the command-line
#+ if one exists.
shift $(($OPTIND - 1))

srm -R "$@"
