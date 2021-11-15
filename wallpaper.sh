#!/bin/bash

trap printout SIGINT
printout() {
   echo $OK_COUNT
   echo $NOK_COUNT
   exit
}

frame=0
wallpaper_path="${BASH_SOURCE%/*}/$1"

if ! [ -d "$wallpaper_path" ]; then
  echo "Input folder not found."
  exit 1
fi

if ! [ -f "$wallpaper_path/frame-0.png" ]; then
  echo "Invalid input folder."
  exit 1
fi

while true
do
  image=$wallpaper_path/frame-$frame.png

  if ! [ -f "$image" ]; then
    frame=0
    continue
  fi

  echo "feh"
  feh --bg-fill $image

  ((frame++))

  sleep 0.01
done
