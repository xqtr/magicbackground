#!/bin/bash


location="~/MagicBackground"
pictures="~/Pictures/wallpapers"

ALIST=( `ls -w1 $pictures/*.jpg` )
RANGE=${#ALIST[@]}
let "number1 = $RANDOM % $RANGE"
picture1=${ALIST[$number1]}
let "number2 = $RANDOM % $RANGE"
picture2=${ALIST[$number2]}
let "number3 = $RANDOM % $RANGE"
picture3=${ALIST[$number3]}
let "number4 = $RANDOM % $RANGE"
picture4=${ALIST[$number4]}
let "number5 = $RANDOM % $RANGE"
picture5=${ALIST[$number5]}

convert -background none  -fill white  -font Ubuntu-Regular -pointsize 32 label:'Random Pictures' "$location"/temp/pictures.png 
#Title
composite "$location"/temp/pictures.png "$location"/box.png -geometry +90+25 "$location"/newbox.png
composite "$location"/icons/photo.png "$location"/newbox.png -geometry +30+17 "$location"/newbox.png


convert $picture1 -thumbnail 256x -font Ubuntu-Bold -pointsize 12 \
          -bordercolor Snow -background black -fill black \
          -gravity center  -set caption '%c %f\n'  -polaroid 10 \
          "$location"/temp/polaroid1.png

convert $picture2 -thumbnail 256x -font Ubuntu-Bold -pointsize 12 \
          -bordercolor Snow -background black -fill black \
          -gravity center  -set caption '%c %f\n'  -polaroid 15 \
          "$location"/temp/polaroid2.png

convert $picture3 -thumbnail 256x -font Ubuntu-Bold -pointsize 12 \
          -bordercolor Snow -background black -fill black \
          -gravity center  -set caption '%c %f\n'  +polaroid \
          "$location"/temp/polaroid3.png

convert $picture4 -thumbnail 256x -font Ubuntu-Bold -pointsize 12 \
          -bordercolor Snow -background black -fill black \
          -gravity center  -set caption '%c %f\n'  -polaroid 10 \
          "$location"/temp/polaroid4.png

convert $picture5 -thumbnail 256x -font Ubuntu-Bold -pointsize 12 \
          -bordercolor Snow -background black -fill black \
          -gravity center  -set caption '%c %f\n'  +polaroid  \
          "$location"/temp/polaroid5.png

composite "$location"/temp/polaroid1.png "$location"/newbox.png -geometry +30+100 "$location"/newbox.png
composite "$location"/temp/polaroid2.png "$location"/newbox.png -geometry +430+100 "$location"/newbox.png
composite "$location"/temp/polaroid3.png "$location"/newbox.png -geometry +530+400 "$location"/newbox.png
composite "$location"/temp/polaroid4.png "$location"/newbox.png -geometry +330+400 "$location"/newbox.png
composite "$location"/temp/polaroid5.png "$location"/newbox.png -geometry +60+380 "$location"/newbox.png

composite "$location"/newbox.png "$location"/wallpaper.png -gravity center "$location"/newwall.png
gconftool-2 --type string --set /desktop/gnome/background/picture_filename ""$location"/newwall.png"

rm "$location"/temp/*

