#!/usr/bin/env bash
set -e

# check if arg 1 is an integer
if [[ "$1" =~ ^[0-9]+$ ]]
then
  # check if arg 1 is between 1-99
  if [ $1 -gt 0 ] && [ $1 -lt 100 ]
  then
    # get total number of lines of input file
    total_lines=$(wc -l $2 | sed 's/^ *//' | cut -f 1 -d " ")
    echo "percent selected: " ${1}
    echo "total lines: " ${total_lines}
    # calculate number of selected lines
    selected_lines=$(expr $1 \* ${total_lines} / 100)
    printf "selected line count: ${selected_lines} \n\n" 
    # print n random lines from input file
    shuf -n ${selected_lines} $2
    exit
  fi
fi
echo "Error: Input must be an integer between 1 and 99, inclusive."
exit
