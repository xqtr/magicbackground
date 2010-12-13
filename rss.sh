#!/bin/bash

location="~/MagicBackground"

#Get RSS Feeds, change this to everything you like
rsstail -1 -N -u http://planet.ellak.gr/atom.xml | head -20 | cat -n >> "$location"/temp/rss1.txt 
rsstail -1 -N -u http://feeds2.feedburner.com/techblogGR | head -20 | cat -n >> "$location"/temp/rss2.txt 
rsstail -1 -N -u http://www.naftemporiki.gr/news/static/rss/news.xml | iconv -f windows-1253 -t utf8 | head -20 | cat -n >> "$location"/temp/rss3.txt 
rsstail -1 -N -u http://planet.ellak.gr/atom.xml | head -20 | cat -n >> "$location"/temp/rss4.txt 
rsstail -1 -N -u http://planet.ellak.gr/atom.xml | head -20 | cat -n >> "$location"/temp/rss5.txt 
rsstail -1 -N -u http://planet.ellak.gr/atom.xml | head -20 | cat -n >> "$location"/temp/rss6.txt 

convert -background none  -fill white  -font Ubuntu-Regular -pointsize 32 label:'RSS Feeds' "$location"/temp/rss.png 
#RSS Title
composite "$location"/temp/rss.png "$location"/box.png -geometry +90+25 "$location"/newbox.png
#Icons
composite "$location"/icons/rss.png "$location"/newbox.png -geometry +30+17 "$location"/newbox.png
composite "$location"/icons/rss16.png "$location"/newbox.png -geometry +30+80 "$location"/newbox.png
composite "$location"/icons/rss16.png "$location"/newbox.png -geometry +30+410 "$location"/newbox.png
composite "$location"/icons/rss16.png "$location"/newbox.png -geometry +330+80 "$location"/newbox.png
composite "$location"/icons/rss16.png "$location"/newbox.png -geometry +330+410 "$location"/newbox.png
composite "$location"/icons/rss16.png "$location"/newbox.png -geometry +610+80 "$location"/newbox.png
composite "$location"/icons/rss16.png "$location"/newbox.png -geometry +610+410 "$location"/newbox.png

#Add titles
convert -background none  -fill white  -font Ubuntu-Bold -pointsize 12 label:'Planet Ellak' "$location"/temp/rss1.png 
convert -background none  -fill white  -font Ubuntu-Bold -pointsize 12 label:'TechBlog GR' "$location"/temp/rss2.png 
convert -background none  -fill white  -font Ubuntu-Bold -pointsize 12 label:'Νέα' "$location"/temp/rss3.png 
convert -background none  -fill white  -font Ubuntu-Bold -pointsize 12 label:'Planet Ellak' "$location"/temp/rss4.png 
convert -background none  -fill white  -font Ubuntu-Bold -pointsize 12 label:'Planet Ellak' "$location"/temp/rss5.png 
convert -background none  -fill white  -font Ubuntu-Bold -pointsize 12 label:'Planet Ellak' "$location"/temp/rss6.png 
composite "$location"/temp/rss1.png "$location"/newbox.png -geometry +50+80 "$location"/newbox.png
composite "$location"/temp/rss2.png "$location"/newbox.png -geometry +50+410 "$location"/newbox.png
composite "$location"/temp/rss3.png "$location"/newbox.png -geometry +350+80 "$location"/newbox.png
composite "$location"/temp/rss4.png "$location"/newbox.png -geometry +350+410 "$location"/newbox.png
composite "$location"/temp/rss5.png "$location"/newbox.png -geometry +630+80 "$location"/newbox.png
composite "$location"/temp/rss6.png "$location"/newbox.png -geometry +630+410 "$location"/newbox.png

#Add feeds
convert -background none -size 240x300 -fill white  -font Ubuntu-Regular -pointsize 12 caption:@"$location"/temp/rss1.txt  "$location"/temp/feeds1.png
convert -background none -size 240x300 -fill white  -font Ubuntu-Regular -pointsize 12 caption:@"$location"/temp/rss2.txt  "$location"/temp/feeds2.png
convert -background none -size 240x300 -fill white  -font Ubuntu-Regular -pointsize 12 caption:@"$location"/temp/rss3.txt  "$location"/temp/feeds3.png
convert -background none -size 240x300 -fill white  -font Ubuntu-Regular -pointsize 12 caption:@"$location"/temp/rss4.txt  "$location"/temp/feeds4.png
convert -background none -size 240x300 -fill white  -font Ubuntu-Regular -pointsize 12 caption:@"$location"/temp/rss5.txt  "$location"/temp/feeds5.png
convert -background none -size 240x300 -fill white  -font Ubuntu-Regular -pointsize 12 caption:@"$location"/temp/rss6.txt  "$location"/temp/feeds6.png
composite "$location"/temp/feeds1.png "$location"/newbox.png -geometry +30+100 "$location"/newbox.png
composite "$location"/temp/feeds2.png "$location"/newbox.png -geometry +30+430 "$location"/newbox.png
composite "$location"/temp/feeds3.png "$location"/newbox.png -geometry +330+100 "$location"/newbox.png
composite "$location"/temp/feeds4.png "$location"/newbox.png -geometry +330+430 "$location"/newbox.png
composite "$location"/temp/feeds5.png "$location"/newbox.png -geometry +610+100 "$location"/newbox.png
composite "$location"/temp/feeds6.png "$location"/newbox.png -geometry +610+430 "$location"/newbox.png

composite "$location"/newbox.png "$location"/wallpaper.png -gravity center "$location"/newwall.png
gconftool-2 --type string --set /desktop/gnome/background/picture_filename ""$location"/newwall.png"

rm "$location"/temp/*

