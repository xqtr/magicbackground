#!/bin/bash

location="~/MagicBackground"
url="http://www.sat24.com/images.php?country=gr&type=slide"

wget -q -O "$location"/temp/greece.gif "$url"


convert -background none  -fill white  -font Ubuntu-Regular -pointsize 32 label:'Greece Sattelite' "$location"/temp/sat.png 
#Title
composite "$location"/temp/sat.png "$location"/box.png -geometry +90+25 "$location"/newbox.png
composite "$location"/icons/sat.png "$location"/newbox.png -geometry +30+17 "$location"/newbox.png


convert	"$location"/temp/greece.gif -resize 850x \
		-contrast-stretch 7% \
		-bordercolor black \
		-border 2 \
		"$location"/temp/greece.png


composite "$location"/temp/greece.png "$location"/newbox.png -geometry +25+90 "$location"/newbox.png



composite "$location"/newbox.png "$location"/wallpaper.png -gravity center "$location"/newwall.png
gconftool-2 --type string --set /desktop/gnome/background/picture_filename ""$location"/newwall.png"

rm "$location"/temp/*

