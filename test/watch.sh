#!/usr/bin/env bash

inotifywait --quiet --event close_write --recursive --monitor ../source ./ @./build | while read -r line; do
  clear
  make
done
