#!/bin/bash

location="~/MagicBackground"
almanak_url="http://news.ert.gr/almanak/"
holidays_url="http://eortologio.gr/rss/si_av_me_el.xml"
qotd_url="http://www.quotationspage.com/random.php3"
zodiac_url="http://www.psychicguild.com/Daily-Horoscope/Scorpio" # Visit the page and change the zodiac, mine is Scorpio :P~~~

month="`date +%B`"
dayname="`date +%A`"
day="`date +%d`"

#Get holidays from website and create the text-image
rsstail -1 -u "$holidays_url" | iconv -f windows-1253 -t utf8 | sed 's/Title: //g' | sed 's/(πηγή : www.eortologio.gr)//g' | sed 's/σήμερα/Σήμερα, /g' | sed 's/αύριο/Αύριο, /g' | sed 's/μεθΑύριο,/Μεθαύριο, /g' | sed 's/δεν υπάρχει μια γιορτή πάρα πολύ γνωστή/Καμμία γιορτή/g' > "$location"/temp/eortes.txt
convert -background none -size 850x60 -fill white  -font Ubuntu-Regular -pointsize 12 caption:@"$location"/temp/eortes.txt  "$location"/temp/eortes.png

#Zodiac web page
wget -q -O "$location"/temp/zodiac.htm "$zodiac_url"
zodiac=$(grep '<div id="now2" style="">' "$location"/temp/zodiac.htm | sed 's/[\t]//g' | sed -e 's/<[a-zA-Z\/][^>]*>//g')
#text-image
convert -background none -size 850x60 -fill white  -font Ubuntu-Regular -pointsize 12 caption:"$zodiac"  "$location"/temp/zodiac.png

#Quote of the day
wget -q -O "$location"/temp/qotd.htm "$qotd_url"
grep "Click for further information about this quotation" "$location"/temp/qotd.htm | sed 's/[\t]//g' | sed -e 's/<[a-zA-Z\/][^>]*>//g' > "$location"/temp/qotd.txt
qotd=$(cat "$location"/temp/qotd.txt | head -n2 | tail -n1 | sed 's/\[[a-zA-Z\/][^>]*\]//g' | sed 's/- More quotations on: //g') 
#text-image
convert -background none -size 850x -fill white  -font Ubuntu-Regular -pointsize 12 caption:"$qotd"  "$location"/temp/qotd.png


#Today Happened
wget -q -O "$location"/temp/almanak.htm "$almanak_url"
grep "anni_year_complex" "$location"/temp/almanak.htm | sed 's/[\t]//g' | sed -e 's/<[a-zA-Z\/][^>]*>//g' > "$location"/temp/years.txt
grep "anni_event_first_complex" "$location"/temp/almanak.htm | sed 's/[\t]//g' | sed -e 's/<[a-zA-Z\/][^>]*>//g' > "$location"/temp/events.txt
sunrise=$(grep "sunrise_complex" "$location"/temp/almanak.htm | sed 's/[\t]//g' | sed -e 's/<[a-zA-Z\/][^>]*>//g' | sed 's/&nbsp;//g') 
sunset=$(grep "sunset_complex" "$location"/temp/almanak.htm | sed 's/[\t]//g' | sed -e 's/<[a-zA-Z\/][^>]*>//g' | sed 's/&nbsp;//g') 

let range=$(cat "$location"/temp/years.txt | wc -l)

FILE1="$location"/temp/years.txt
FILE2="$location"/temp/events.txt

#These are random events. 
let "n1=${RANDOM}%$(wc -l < $FILE1)"
let "n2=${RANDOM}%$(wc -l < $FILE1)"
let "n3=${RANDOM}%$(wc -l < $FILE1)"
let "n4=${RANDOM}%$(wc -l < $FILE1)"
let "n5=${RANDOM}%$(wc -l < $FILE1)"
let "n6=${RANDOM}%$(wc -l < $FILE1)"
let "n7=${RANDOM}%$(wc -l < $FILE1)"
let "n8=${RANDOM}%$(wc -l < $FILE1)"
let "n9=${RANDOM}%$(wc -l < $FILE1)"
let "n10=${RANDOM}%$(wc -l < $FILE1)"

#text-image for the Title
convert -background none  -fill white  -font Ubuntu-Regular -pointsize 32 label:'Today' "$location"/temp/today.png

 
#Title and icons - add icons to the main box
composite "$location"/temp/today.png "$location"/box.png -geometry +90+25 "$location"/newbox.png
composite "$location"/icons/today.png "$location"/newbox.png -geometry +25+17 "$location"/newbox.png
composite "$location"/icons/sunrise.png "$location"/newbox.png -geometry +25+340 "$location"/newbox.png
composite "$location"/icons/moon.png "$location"/newbox.png -geometry +25+442 "$location"/newbox.png
composite "$location"/icons/qotd.png "$location"/newbox.png -geometry +25+540 "$location"/newbox.png
composite "$location"/icons/info.png "$location"/newbox.png -geometry +25+620 "$location"/newbox.png

#What day is - create calendar image
convert "$location"/icons/date.png \
	  -font Ubuntu-Bold -pointsize 24 -fill white \
          -gravity North -annotate +0+80 "$month" \
	  -font Ubuntu-Bold -pointsize 84 -fill black \
          -gravity center      -annotate +0+25 "$day" \
	  -font Ubuntu-Bold -pointsize 18 -fill black \
          -gravity south      -annotate +0+30 "$dayname" \
          "$location"/temp/date.png

#Various text added to main box
convert "$location"/newbox.png \
	  -font Ubuntu-Bold -pointsize 20 -fill white \
	  -gravity southwest -annotate +60+407 "Holidays..." \
	  -gravity southwest -annotate +60+305 "Horoscope..." \
	  -gravity southwest -annotate +60+126 "Σαν σήμερα..." \
	  -gravity southwest -annotate +60+205 "Quote of the day..." \
	  -font Ubuntu-Bold -pointsize 14 -fill white \
	  -gravity west -annotate +180-32 "$sunrise" \
	  -gravity west -annotate +285-32 "$sunset" \
	  -font Ubuntu-Regular -pointsize 12 -fill white \
          -gravity southwest -annotate +25+27 "$(head -n $n1 $FILE1 | tail -1)" \
          -gravity southwest -annotate +70+27 "$(head -n $n1 $FILE2 | tail -1):0:80" \
          -gravity southwest -annotate +25+42 "$(head -n $n2 $FILE1 | tail -1)" \
          -gravity southwest -annotate +70+42 "$(head -n $n2 $FILE2 | tail -1):0:80" \
          -gravity southwest -annotate +25+57 "$(head -n $n3 $FILE1 | tail -1)" \
          -gravity southwest -annotate +70+57 "$(head -n $n3 $FILE2 | tail -1):0:80" \
          -gravity southwest -annotate +25+72 "$(head -n $n4 $FILE1 | tail -1)" \
          -gravity southwest -annotate +70+72 "$(head -n $n4 $FILE2 | tail -1):0:80" \
          -gravity southwest -annotate +25+87 "$(head -n $n5 $FILE1 | tail -1)" \
          -gravity southwest -annotate +70+87 "$(head -n $n5 $FILE2 | tail -1):0:80" \
          -gravity southwest -annotate +25+102 "$(head -n $n6 $FILE1 | tail -1)" \
          -gravity southwest -annotate +70+102 "$(head -n $n6 $FILE2 | tail -1):0:80" \
          "$location"/newbox.png


#Add all images to the wallpaper
composite "$location"/temp/date.png "$location"/newbox.png -geometry +330+90  "$location"/newbox.png
composite "$location"/temp/zodiac.png "$location"/newbox.png -geometry +25+480  "$location"/newbox.png
composite "$location"/temp/eortes.png "$location"/newbox.png -geometry +25+379 "$location"/newbox.png
composite "$location"/temp/qotd.png "$location"/newbox.png -geometry +25+580 "$location"/newbox.png
composite "$location"/newbox.png "$location"/wallpaper.png -gravity center "$location"/newwall.png
gconftool-2 --type string --set /desktop/gnome/background/picture_filename ""$location"/newwall.png"

rm "$location"/temp/*

