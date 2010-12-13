#!/bin/bash

location="~/MagicBackground"

#Get weather
"$location"/scripts/wunderground-script.sh
#The weather script is not mine. I found it on Ubuntu Forums and belongs to a greek guy. Very nice script, thank him!

convert -background none  -fill white  -font Ubuntu-Regular -pointsize 32 label:'Weather' "$location"/temp/weather.png 
#Weather Title
composite "$location"/temp/weather.png "$location"/box.png -geometry +90+25 "$location"/newbox.png
#Icons
composite "$location"/icons/weather.png "$location"/newbox.png -geometry +30+17 "$location"/newbox.png



today=$(sed -n '1p' "$location"/scripts/messages.wun)
todaydesc=$(sed -n '2p' "$location"/scripts/messages.wun)
todayhigh=$(sed -n '3p' "$location"/scripts/messages.wun)
todaywind=$(sed -n '4p' "$location"/scripts/messages.wun)
todayn=$(sed -n '5p' "$location"/scripts/messages.wun)
todayndesc=$(sed -n '6p' "$location"/scripts/messages.wun)
todaylow=$(sed -n '7p' "$location"/scripts/messages.wun)
todaynwind=$(sed -n '8p' "$location"/scripts/messages.wun)

case $todaydesc in 
"Chance of Flurries") icon="37";;
"Chance of Rain" ) icon="11";;
"Chance of Freezing Rain" ) icon="09";;
"Light Freezing Rain") icon="08";;
"Chance of Sleet") icon="05";;
"Chance of Snow") icon="13";;
"Chance of Thunderstorms") icon="38";;
"Chance of a Thunderstorm") icon="38";;
"Clear") icon="32";;
"Cloudy") icon="30";;
"Flurries") icon="37";;
"Fog") icon="20";;
"Haze") icon="21";;
"Mostly Cloudy") icon="26";;
"Mostly Sunny") icon="30";;
"Partly Cloudy") icon="28";;
"Partly Sunny") icon="28";;
"Freezing Rain") icon="09";;
"Rain") icon="10";;
"Sleet") icon="07";;
"Snow") icon="06";;
"Sunny") icon="32";;
"Thunderstorms" ) icon="04";;
"Thunderstorm") icon="04";;
"Overcast") icon="44";;
"Scattered Clouds") icon="34";;
*)icon="na";;
esac

case $todayndesc in 
"Chance of Flurries") icon1="37";;
"Chance of Rain" ) icon1="11";;
"Chance of Freezing Rain" ) icon1="09";;
"Light Freezing Rain") icon1="08";;
"Chance of Sleet") icon1="05";;
"Chance of Snow") icon1="13";;
"Chance of Thunderstorms") icon1="38";;
"Chance of a Thunderstorm") icon1="38";;
"Clear") icon1="31";;
"Cloudy") icon1="30";;
"Flurries") icon1="37";;
"Fog") icon1="20";;
"Haze") icon1="21";;
"Mostly Cloudy") icon1="27";;
"Mostly Sunny") icon1="30";;
"Partly Cloudy") icon1="29";;
"Partly Sunny") icon1="28";;
"Freezing Rain") icon1="09";;
"Rain") icon1="45";;
"Sleet") icon1="07";;
"Snow") icon1="46";;
"Sunny") icon1="32";;
"Thunderstorms" ) icon1="04";;
"Thunderstorm") icon1="04";;
"Overcast") icon1="44";;
"Scattered Clouds") icon1="33";;
*)icon1="na";;
esac

 convert "$location"/icons/weather/"$icon".png \
	  -font Ubuntu-Bold -pointsize 20 -fill white \
	  -gravity North   -background none  -splice 0x24 \
	  -gravity South   -background none  -splice 0x24 \
          -gravity North -annotate 0 "$today" \
	  -font Ubuntu-Bold -pointsize 14 -fill white \
          -gravity south      -annotate +0+20 Day:"$todaydesc" \
	  -font Ubuntu-Regular -pointsize 14 -fill white \
          -gravity south      -annotate 0 Night:"$todayndesc" \
          -gravity southeast  -annotate +0+60 "$todaylow" \
          -gravity southeast  -annotate +0+80 "$todayhigh" \
          -gravity southeast  -annotate +0+40 "$todaywind" \
          "$location"/temp/today1.png

composite -geometry +0+200  "$location"/icons/weather/small/"$icon1".png "$location"/temp/today1.png "$location"/temp/today1.png

today=$(sed -n '9p' "$location"/scripts/messages.wun)
todaydesc=$(sed -n '10p' "$location"/scripts/messages.wun)
todayhigh=$(sed -n '11p' "$location"/scripts/messages.wun)
todaywind=$(sed -n '12p' "$location"/scripts/messages.wun)
todayn=$(sed -n '13p' "$location"/scripts/messages.wun)
todayndesc=$(sed -n '14p' "$location"/scripts/messages.wun)
todaylow=$(sed -n '15p' "$location"/scripts/messages.wun)
todaynwind=$(sed -n '16p' "$location"/scripts/messages.wun)

case $todaydesc in 
"Chance of Flurries") icon="37";;
"Chance of Rain" ) icon="11";;
"Chance of Freezing Rain" ) icon="09";;
"Light Freezing Rain") icon="08";;
"Chance of Sleet") icon="05";;
"Chance of Snow") icon="13";;
"Chance of Thunderstorms") icon="38";;
"Chance of a Thunderstorm") icon="38";;
"Clear") icon="32";;
"Cloudy") icon="30";;
"Flurries") icon="37";;
"Fog") icon="20";;
"Haze") icon="21";;
"Mostly Cloudy") icon="26";;
"Mostly Sunny") icon="30";;
"Partly Cloudy") icon="28";;
"Partly Sunny") icon="28";;
"Freezing Rain") icon="09";;
"Rain") icon="10";;
"Sleet") icon="07";;
"Snow") icon="06";;
"Sunny") icon="32";;
"Thunderstorms" ) icon="04";;
"Thunderstorm") icon="04";;
"Overcast") icon="44";;
"Scattered Clouds") icon="34";;
*)icon="na";;
esac

case $todayndesc in 
"Chance of Flurries") icon1="37";;
"Chance of Rain" ) icon1="11";;
"Chance of Freezing Rain" ) icon1="09";;
"Light Freezing Rain") icon1="08";;
"Chance of Sleet") icon1="05";;
"Chance of Snow") icon1="13";;
"Chance of Thunderstorms") icon1="38";;
"Chance of a Thunderstorm") icon1="38";;
"Clear") icon1="31";;
"Cloudy") icon1="30";;
"Flurries") icon1="37";;
"Fog") icon1="20";;
"Haze") icon1="21";;
"Mostly Cloudy") icon1="27";;
"Mostly Sunny") icon1="30";;
"Partly Cloudy") icon1="29";;
"Partly Sunny") icon1="28";;
"Freezing Rain") icon1="09";;
"Rain") icon1="45";;
"Sleet") icon1="07";;
"Snow") icon1="46";;
"Sunny") icon1="32";;
"Thunderstorms" ) icon1="04";;
"Thunderstorm") icon1="04";;
"Overcast") icon1="44";;
"Scattered Clouds") icon1="33";;
*)icon1="na";;
esac

 convert "$location"/icons/weather/"$icon".png \
	  -font Ubuntu-Bold -pointsize 20 -fill white \
	  -gravity North   -background none  -splice 0x24 \
	  -gravity South   -background none  -splice 0x24 \
          -gravity North -annotate 0 "$today" \
	  -font Ubuntu-Bold -pointsize 14 -fill white \
          -gravity south      -annotate +0+20 Day:"$todaydesc" \
	  -font Ubuntu-Regular -pointsize 14 -fill white \
          -gravity south      -annotate 0 Night:"$todayndesc" \
          -gravity southeast  -annotate +0+60 "$todaylow" \
          -gravity southeast  -annotate +0+80 "$todayhigh" \
          -gravity southeast  -annotate +0+40 "$todaywind" \
          "$location"/temp/today2.png

composite -geometry +0+200  "$location"/icons/weather/small/"$icon1".png "$location"/temp/today2.png "$location"/temp/today2.png

today=$(sed -n '17p' "$location"/scripts/messages.wun)
todaydesc=$(sed -n '18p' "$location"/scripts/messages.wun)
todayhigh=$(sed -n '19p' "$location"/scripts/messages.wun)
todaywind=$(sed -n '20p' "$location"/scripts/messages.wun)
todayn=$(sed -n '21p' "$location"/scripts/messages.wun)
todayndesc=$(sed -n '22p' "$location"/scripts/messages.wun)
todaylow=$(sed -n '23p' "$location"/scripts/messages.wun)
todaynwind=$(sed -n '24p' "$location"/scripts/messages.wun)

case $todaydesc in 
"Chance of Flurries") icon="37";;
"Chance of Rain" ) icon="11";;
"Chance of Freezing Rain" ) icon="09";;
"Light Freezing Rain") icon="08";;
"Chance of Sleet") icon="05";;
"Chance of Snow") icon="13";;
"Chance of Thunderstorms") icon="38";;
"Chance of a Thunderstorm") icon="38";;
"Clear") icon="32";;
"Cloudy") icon="30";;
"Flurries") icon="37";;
"Fog") icon="20";;
"Haze") icon="21";;
"Mostly Cloudy") icon="26";;
"Mostly Sunny") icon="30";;
"Partly Cloudy") icon="28";;
"Partly Sunny") icon="28";;
"Freezing Rain") icon="09";;
"Rain") icon="10";;
"Sleet") icon="07";;
"Snow") icon="06";;
"Sunny") icon="32";;
"Thunderstorms" ) icon="04";;
"Thunderstorm") icon="04";;
"Overcast") icon="44";;
"Scattered Clouds") icon="34";;
*)icon="na";;
esac

case $todayndesc in 
"Chance of Flurries") icon1="37";;
"Chance of Rain" ) icon1="11";;
"Chance of Freezing Rain" ) icon1="09";;
"Light Freezing Rain") icon1="08";;
"Chance of Sleet") icon1="05";;
"Chance of Snow") icon1="13";;
"Chance of Thunderstorms") icon1="38";;
"Chance of a Thunderstorm") icon1="38";;
"Clear") icon1="31";;
"Cloudy") icon1="30";;
"Flurries") icon1="37";;
"Fog") icon1="20";;
"Haze") icon1="21";;
"Mostly Cloudy") icon1="27";;
"Mostly Sunny") icon1="30";;
"Partly Cloudy") icon1="29";;
"Partly Sunny") icon1="28";;
"Freezing Rain") icon1="09";;
"Rain") icon1="45";;
"Sleet") icon1="07";;
"Snow") icon1="46";;
"Sunny") icon1="32";;
"Thunderstorms" ) icon1="04";;
"Thunderstorm") icon1="04";;
"Overcast") icon1="44";;
"Scattered Clouds") icon1="33";;
*)icon1="na";;
esac

 convert "$location"/icons/weather/"$icon".png \
	  -font Ubuntu-Bold -pointsize 20 -fill white \
	  -gravity North   -background none  -splice 0x24 \
	  -gravity South   -background none  -splice 0x24 \
          -gravity North -annotate 0 "$today" \
	  -font Ubuntu-Bold -pointsize 14 -fill white \
          -gravity south      -annotate +0+20 Day:"$todaydesc" \
	  -font Ubuntu-Regular -pointsize 14 -fill white \
          -gravity south      -annotate 0 Night:"$todayndesc" \
          -gravity southeast  -annotate +0+60 "$todaylow" \
          -gravity southeast  -annotate +0+80 "$todayhigh" \
          -gravity southeast  -annotate +0+40 "$todaywind" \
          "$location"/temp/today3.png

composite -geometry +0+200  "$location"/icons/weather/small/"$icon1".png "$location"/temp/today3.png "$location"/temp/today3.png

today=$(sed -n '25p' "$location"/scripts/messages.wun)
todaydesc=$(sed -n '26p' "$location"/scripts/messages.wun)
todayhigh=$(sed -n '27p' "$location"/scripts/messages.wun)
todaywind=$(sed -n '28p' "$location"/scripts/messages.wun)
todayn=$(sed -n '29p' "$location"/scripts/messages.wun)
todayndesc=$(sed -n '30p' "$location"/scripts/messages.wun)
todaylow=$(sed -n '31p' "$location"/scripts/messages.wun)
todaynwind=$(sed -n '32p' "$location"/scripts/messages.wun)

case $todaydesc in 
"Chance of Flurries") icon="37";;
"Chance of Rain" ) icon="11";;
"Chance of Freezing Rain" ) icon="09";;
"Light Freezing Rain") icon="08";;
"Chance of Sleet") icon="05";;
"Chance of Snow") icon="13";;
"Chance of Thunderstorms") icon="38";;
"Chance of a Thunderstorm") icon="38";;
"Clear") icon="32";;
"Cloudy") icon="30";;
"Flurries") icon="37";;
"Fog") icon="20";;
"Haze") icon="21";;
"Mostly Cloudy") icon="26";;
"Mostly Sunny") icon="30";;
"Partly Cloudy") icon="28";;
"Partly Sunny") icon="28";;
"Freezing Rain") icon="09";;
"Rain") icon="10";;
"Sleet") icon="07";;
"Snow") icon="06";;
"Sunny") icon="32";;
"Thunderstorms" ) icon="04";;
"Thunderstorm") icon="04";;
"Overcast") icon="44";;
"Scattered Clouds") icon="34";;
*)icon="na";;
esac

case $todayndesc in 
"Chance of Flurries") icon1="37";;
"Chance of Rain" ) icon1="11";;
"Chance of Freezing Rain" ) icon1="09";;
"Light Freezing Rain") icon1="08";;
"Chance of Sleet") icon1="05";;
"Chance of Snow") icon1="13";;
"Chance of Thunderstorms") icon1="38";;
"Chance of a Thunderstorm") icon1="38";;
"Clear") icon1="31";;
"Cloudy") icon1="30";;
"Flurries") icon1="37";;
"Fog") icon1="20";;
"Haze") icon1="21";;
"Mostly Cloudy") icon1="27";;
"Mostly Sunny") icon1="30";;
"Partly Cloudy") icon1="29";;
"Partly Sunny") icon1="28";;
"Freezing Rain") icon1="09";;
"Rain") icon1="45";;
"Sleet") icon1="07";;
"Snow") icon1="46";;
"Sunny") icon1="32";;
"Thunderstorms" ) icon1="04";;
"Thunderstorm") icon1="04";;
"Overcast") icon1="44";;
"Scattered Clouds") icon1="33";;
*)icon1="na";;
esac

 convert "$location"/icons/weather/"$icon".png \
	  -font Ubuntu-Bold -pointsize 20 -fill white \
	  -gravity North   -background none  -splice 0x24 \
	  -gravity South   -background none  -splice 0x24 \
          -gravity North -annotate 0 "$today" \
	  -font Ubuntu-Bold -pointsize 14 -fill white \
          -gravity south      -annotate +0+20 Day:"$todaydesc" \
	  -font Ubuntu-Regular -pointsize 14 -fill white \
          -gravity south      -annotate 0 Night:"$todayndesc" \
          -gravity southeast  -annotate +0+60 "$todaylow" \
          -gravity southeast  -annotate +0+80 "$todayhigh" \
          -gravity southeast  -annotate +0+40 "$todaywind" \
          "$location"/temp/today4.png

composite -geometry +0+200  "$location"/icons/weather/small/"$icon1".png "$location"/temp/today4.png "$location"/temp/today4.png

today=$(sed -n '33p' "$location"/scripts/messages.wun)
todaydesc=$(sed -n '34p' "$location"/scripts/messages.wun)
todayhigh=$(sed -n '35p' "$location"/scripts/messages.wun)
todaywind=$(sed -n '36p' "$location"/scripts/messages.wun)
todayn=$(sed -n '37p' "$location"/scripts/messages.wun)
todayndesc=$(sed -n '38p' "$location"/scripts/messages.wun)
todaylow=$(sed -n '39p' "$location"/scripts/messages.wun)
todaynwind=$(sed -n '40p' "$location"/scripts/messages.wun)

case $todaydesc in 
"Chance of Flurries") icon="37";;
"Chance of Rain" ) icon="11";;
"Chance of Freezing Rain" ) icon="09";;
"Light Freezing Rain") icon="08";;
"Chance of Sleet") icon="05";;
"Chance of Snow") icon="13";;
"Chance of Thunderstorms") icon="38";;
"Chance of a Thunderstorm") icon="38";;
"Clear") icon="32";;
"Cloudy") icon="30";;
"Flurries") icon="37";;
"Fog") icon="20";;
"Haze") icon="21";;
"Mostly Cloudy") icon="26";;
"Mostly Sunny") icon="30";;
"Partly Cloudy") icon="28";;
"Partly Sunny") icon="28";;
"Freezing Rain") icon="09";;
"Rain") icon="10";;
"Sleet") icon="07";;
"Snow") icon="06";;
"Sunny") icon="32";;
"Thunderstorms" ) icon="04";;
"Thunderstorm") icon="04";;
"Overcast") icon="44";;
"Scattered Clouds") icon="34";;
*)icon="na";;
esac

case $todayndesc in 
"Chance of Flurries") icon1="37";;
"Chance of Rain" ) icon1="11";;
"Chance of Freezing Rain" ) icon1="09";;
"Light Freezing Rain") icon1="08";;
"Chance of Sleet") icon1="05";;
"Chance of Snow") icon1="13";;
"Chance of Thunderstorms") icon1="38";;
"Chance of a Thunderstorm") icon1="38";;
"Clear") icon1="31";;
"Cloudy") icon1="30";;
"Flurries") icon1="37";;
"Fog") icon1="20";;
"Haze") icon1="21";;
"Mostly Cloudy") icon1="27";;
"Mostly Sunny") icon1="30";;
"Partly Cloudy") icon1="29";;
"Partly Sunny") icon1="28";;
"Freezing Rain") icon1="09";;
"Rain") icon1="45";;
"Sleet") icon1="07";;
"Snow") icon1="46";;
"Sunny") icon1="32";;
"Thunderstorms" ) icon1="04";;
"Thunderstorm") icon1="04";;
"Overcast") icon1="44";;
"Scattered Clouds") icon1="33";;
*)icon1="na";;
esac

 convert "$location"/icons/weather/"$icon".png \
	  -font Ubuntu-Bold -pointsize 20 -fill white \
	  -gravity North   -background none  -splice 0x24 \
	  -gravity South   -background none  -splice 0x24 \
          -gravity North -annotate 0 "$today" \
	  -font Ubuntu-Bold -pointsize 14 -fill white \
          -gravity south      -annotate +0+20 Day:"$todaydesc" \
	  -font Ubuntu-Regular -pointsize 14 -fill white \
          -gravity south      -annotate 0 Night:"$todayndesc" \
          -gravity southeast  -annotate +0+60 "$todaylow" \
          -gravity southeast  -annotate +0+80 "$todayhigh" \
          -gravity southeast  -annotate +0+40 "$todaywind" \
          "$location"/temp/today5.png

composite -geometry +0+200  "$location"/icons/weather/small/"$icon1".png "$location"/temp/today5.png "$location"/temp/today5.png

today=$(sed -n '41p' "$location"/scripts/messages.wun)
todaydesc=$(sed -n '42p' "$location"/scripts/messages.wun)
todayhigh=$(sed -n '43p' "$location"/scripts/messages.wun)
todaywind=$(sed -n '44p' "$location"/scripts/messages.wun)
todayn=$(sed -n '45p' "$location"/scripts/messages.wun)
todayndesc=$(sed -n '46p' "$location"/scripts/messages.wun)
todaylow=$(sed -n '47p' "$location"/scripts/messages.wun)
todaynwind=$(sed -n '48p' "$location"/scripts/messages.wun)

case $todaydesc in 
"Chance of Flurries") icon="37";;
"Chance of Rain" ) icon="11";;
"Chance of Freezing Rain" ) icon="09";;
"Light Freezing Rain") icon="08";;
"Chance of Sleet") icon="05";;
"Chance of Snow") icon="13";;
"Chance of Thunderstorms") icon="38";;
"Chance of a Thunderstorm") icon="38";;
"Clear") icon="32";;
"Cloudy") icon="30";;
"Flurries") icon="37";;
"Fog") icon="20";;
"Haze") icon="21";;
"Mostly Cloudy") icon="26";;
"Mostly Sunny") icon="30";;
"Partly Cloudy") icon="28";;
"Partly Sunny") icon="28";;
"Freezing Rain") icon="09";;
"Rain") icon="10";;
"Sleet") icon="07";;
"Snow") icon="06";;
"Sunny") icon="32";;
"Thunderstorms" ) icon="04";;
"Thunderstorm") icon="04";;
"Overcast") icon="44";;
"Scattered Clouds") icon="34";;
*)icon="na";;
esac

case $todayndesc in 
"Chance of Flurries") icon1="37";;
"Chance of Rain" ) icon1="11";;
"Chance of Freezing Rain" ) icon1="09";;
"Light Freezing Rain") icon1="08";;
"Chance of Sleet") icon1="05";;
"Chance of Snow") icon1="13";;
"Chance of Thunderstorms") icon1="38";;
"Chance of a Thunderstorm") icon1="38";;
"Clear") icon1="31";;
"Cloudy") icon1="30";;
"Flurries") icon1="37";;
"Fog") icon1="20";;
"Haze") icon1="21";;
"Mostly Cloudy") icon1="27";;
"Mostly Sunny") icon1="30";;
"Partly Cloudy") icon1="29";;
"Partly Sunny") icon1="28";;
"Freezing Rain") icon1="09";;
"Rain") icon1="45";;
"Sleet") icon1="07";;
"Snow") icon1="46";;
"Sunny") icon1="32";;
"Thunderstorms" ) icon1="04";;
"Thunderstorm") icon1="04";;
"Overcast") icon1="44";;
"Scattered Clouds") icon1="33";;
*)icon1="na";;
esac

 convert "$location"/icons/weather/"$icon".png \
	  -font Ubuntu-Bold -pointsize 20 -fill white \
	  -gravity North   -background none  -splice 0x24 \
	  -gravity South   -background none  -splice 0x24 \
          -gravity North -annotate 0 "$today" \
	  -font Ubuntu-Bold -pointsize 14 -fill white \
          -gravity south      -annotate +0+20 Day:"$todaydesc" \
	  -font Ubuntu-Regular -pointsize 14 -fill white \
          -gravity south      -annotate 0 Night:"$todayndesc" \
          -gravity southeast  -annotate +0+60 "$todaylow" \
          -gravity southeast  -annotate +0+80 "$todayhigh" \
          -gravity southeast  -annotate +0+40 "$todaywind" \
          "$location"/temp/today6.png

composite -geometry +0+200  "$location"/icons/weather/small/"$icon1".png "$location"/temp/today6.png "$location"/temp/today6.png

today=$(sed -n '49p' "$location"/scripts/messages.wun)
todaydesc=$(sed -n '50p' "$location"/scripts/messages.wun)
todayhigh=$(sed -n '51p' "$location"/scripts/messages.wun)
todaywind=$(sed -n '52p' "$location"/scripts/messages.wun)
todayn=$(sed -n '53p' "$location"/scripts/messages.wun)
todayndesc=$(sed -n '54p' "$location"/scripts/messages.wun)
todaylow=$(sed -n '55p' "$location"/scripts/messages.wun)
todaynwind=$(sed -n '56p' "$location"/scripts/messages.wun)

#convert -background none -fill white label:"$todaydesc" newbox.png

composite "$location"/temp/today1.png "$location"/newbox.png -geometry +30+100 "$location"/newbox.png
composite "$location"/temp/today2.png "$location"/newbox.png -geometry +300+100 "$location"/newbox.png
composite "$location"/temp/today3.png "$location"/newbox.png -geometry +600+100 "$location"/newbox.png
composite "$location"/temp/today4.png "$location"/newbox.png -geometry +30+430 "$location"/newbox.png
composite "$location"/temp/today5.png "$location"/newbox.png -geometry +300+430 "$location"/newbox.png
composite "$location"/temp/today6.png "$location"/newbox.png -geometry +600+430 "$location"/newbox.png

composite "$location"/newbox.png "$location"/wallpaper.png -gravity center "$location"/newwall.png
gconftool-2 --type string --set /desktop/gnome/background/picture_filename ""$location"/newwall.png"

rm "$location"/temp/*

