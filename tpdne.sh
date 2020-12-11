#!/bin/bash

# Image downloader by Ray Heffer, February 23 2019
# Adapted by Christian Roessler, December 11 2020, V1.3
# Blog: https://rayheffer.com
# GitHub: https://github.com/rayheffer/tpdne
#         https://github.com/croessler/tpdne

# Configuration
max=5
url=https://www.thispersondoesnotexist.com/image
imgdir=images
delay=1.0 # delay must be min. 1 because
#            a) generation interval of tpdns and
#            b) timestamp only provides seconds on Mac (so i left it like that)

# Create images directory if it doesn't exist
mkdir -p $imgdir
cd $imgdir

printf 'Downloading '$max' images'
printf '\n'

# Loop to download images $max number of times
count=1
while [ $count -le $max ]
do
wget -O `date +"%Y%m%d%H%M%S"`.jpg -q $url -P $imgdir/
printf '\r%2d Completed' $count
sleep $delay
((count++))
done

cd ..

# Complete!
printf '\n'
printf "Downloads complete! All images saved to $imgdir/"
printf '\n'
