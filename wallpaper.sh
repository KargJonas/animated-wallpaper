#!/bin/bash

trap printout SIGINT
printout() {
   echo $OK_COUNT
   echo $NOK_COUNT
   exit
}

frame=0

while true
do
  image=$(pwd)/wallpaper/frame-$frame.png
  # echo $image

  if ! [ -f "$image" ]; then
    frame=0
    continue
  fi

  feh --bg-fill $image

  ((frame++))

  sleep 0.01
done
