#!/usr/bin/env bash

RED='\033[0;31m'
NC='\033[0m'

PATHS_TO_SEARCH="/system /system/vendor /system/product /system/system_ext"

function get_binary_path() {
  bin=$(which $1)
  if [ -z "$bin" ]; then
    echo "$1 is not installed"
    exit 1
  fi
  export $1=$bin
}

get_binary_path adb
get_binary_path basename

source ./install.sh

PATHS=$REPLACE
NONEXISTENT_PATHS=()

if [ -z "$PATHS" ]; then
  echo "No paths to search."
  exit 1
fi

for PATH in $PATHS
do
  $adb shell ls $PATH > /dev/null 2>&1
  if [ $? -ne 0 ]; then
    echo -e "Path $RED$PATH$NC does not exist!"
    NONEXISTENT_PATHS+=($PATH)
  fi
done

if [ ${#NONEXISTENT_PATHS[@]} -ne 0 ]; then
  NONEXISTENT_BASENAME_PATHS=()
  for PATH in ${NONEXISTENT_PATHS[@]}
  do
    BASENAME=$($basename $PATH)
    NONEXISTENT_BASENAME_PATHS+=($BASENAME)
  done
  NONEXISTENT_BASENAME_PATHS=${NONEXISTENT_BASENAME_PATHS[@]}

  findcmd="find $PATHS_TO_SEARCH \( -iname ${NONEXISTENT_BASENAME_PATHS// / -o -iname } \)"

  echo -e "\nPossible replacement paths $RED(CHECK CAREFULLY!)$NC:"
  $adb shell "$findcmd 2>&1 | grep -v 'Permission denied'"
else
  echo "Good news! All paths exist."
fi
