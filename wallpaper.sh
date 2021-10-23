#!/bin/bash

trap printout SIGINT
printout() {
   echo $OK_COUNT
   echo $NOK_COUNT
   exit
}

frame=0

if ! [ -d "$1" ]; then
  echo "Input folder not found."
  exit 1
fi

if ! [ -f "$1/frame-0.png" ]; then
  echo "Invalid input folder."
  exit 1
fi

while true
do
  image=$(pwd)/$1/frame-$frame.png
  # echo $image

  if ! [ -f "$image" ]; then
    frame=0
    continue
  fi

  feh --bg-fill $image

  ((frame++))

  sleep 0.01
done
