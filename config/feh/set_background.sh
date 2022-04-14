#!/bin/bash

# while true
# do
#     file=$( find "$HOME/Pictures/wallpapers" -type f -print0 | shuf -z -n 1 )
#     feh --bg-scale $file --bg-scale $file &
#     sleep 100
# done

file=$( find "$HOME/Pictures/wallpapers" -type f -print0 | shuf -z -n 1 )
feh --bg-scale $file --bg-scale $file &

