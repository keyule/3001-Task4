#!/bin/sh

palette="/tmp/palette.png"
filters="fps=10,scale=900:-1:flags=lanczos"

ffmpeg -v warning -ss 6 -i $1 -vf "$filters,palettegen" -y $palette
ffmpeg -v warning -ss 6 -i $1 -i $palette -lavfi "$filters [x]; [x][1:v] paletteuse" -y $2