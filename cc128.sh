#!/bin/bash

show_help() {
  echo "Read cc128 (current cost) serial data 

Example
    $0 /dev/ttyUSB1 
 
Usage:
    $0 [-h] <cc128 device>
  Options:
    -h
      Show this help.
" >&2
}

## arguments parsing #########

# A POSIX variable
OPTIND=1         # Reset in case getopts has been used previously in the shell.

while getopts "h?v" opt; do
    case "$opt" in
    h|\?)
        show_help
        exit 0
        ;;
    esac
done

shift $((OPTIND-1))

[ "$1" = "--" ] && shift

#######################################

device="$1"


[[ ! -c $device ]] && show_help && exit 1

stty -F $device 57600
while [ 1 ]
do
	head $device -n200
done
