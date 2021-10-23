#!/bin/bash

if ! [ -f "$1" ]; then
  echo "Input file does not exist."
  exit 1
fi

if [ -z "$2" ]; then
  echo "No output folder provided."
  exit 1
fi

mkdir $(pwd)/$2
rm $(pwd)/$2/*

exec gm convert $1 -coalesce +adjoin $(pwd)/$2/frame-%d.png