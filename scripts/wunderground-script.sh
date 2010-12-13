#!/bin/bash
location="/home/x/Scripts/MagicBackground/scripts"

wget -O "$location"/ics1 http://ical.wunderground.com/auto/ical/global/stations/16716.ics?units=metric #Athens, Greece. Change this to your city
sed  's/\./\n/g' "$location"/ics1 > "$location"/ics
egrep -i 'description|monday|tuesday|wednesday|thursday|friday|saturday|sunday|high|low|wind' "$location"/ics >"$location"/messages.wun
sed -i 's/DESCRIPTION://g' "$location"/messages.wun
sed -i 's/\\n/\n/g' "$location"/messages.wun
sed -i 's/ - /\n/g' "$location"/messages.wun
sed -i 's/High/\nHigh/g' "$location"/messages.wun
sed -i 's/Low/\nLow/g' "$location"/messages.wun
cp "$location"/messages.wun "$location"/temp1.wun
sed -i 's/Wind /\n/g' "$location"/messages.wun
sed -i '/^ /d' "$location"/messages.wun
sed -i '/^$/d' "$location"/messages.wun
sed -i 's/Wind/\nWind/g' "$location"/temp1.wun
sed -i 's/\./\n/g' "$location"/temp1.wun
grep -i Wind "$location"/temp1.wun>"$location"/wind-icons-messages.wun
sed -i 's/Wind //g' "$location"/wind-icons-messages.wun
sed -i 's/ km\/h//g' "$location"/wind-icons-messages.wun
cut -c1-3 "$location"/wind-icons-messages.wun >"$location"/icons.wun
rm "$location"/14
rm "$location"/13
rm "$location"/12
a=`sed -n '$=' "$location"/wind-icons-messages.wun`
if  [ $a -eq "13" ];
then sed -i '1s/^/Today\n   -\n       -                \n        -                \n/' "$location"/messages.wun
sed -i '1s/^/\n/' "$location"/icons.wun
echo $a>"$location"/13
elif [ $a -eq "12" ];
then sed -i '12s/$/\n\n/' "$location"/icons.wun
sed -i '48s/$/\n\n   -\n       -                \n        -                \n\n   -\n       -                \n        -                \n/' "$location"/messages.wun
echo $a>"$location"/12
elif [ $a -eq "14" ];
then echo $a>"$location"/14
fi;
a=`sed -n '2p' "$location"/messages.wun`
if test "$a" = "Chance of Flurries"
then sed -i '14s/$/\np/' "$location"/icons.wun
elif test "$a" = "Chance of Rain"
then sed -i '14s/$/\nh/' "$location"/icons.wun
elif test "$a" = "Chance of Freezing Rain" || test "$a" = "Light Freezing Rain" || test "$a" = "Light Freezing Rain"
then sed -i '14s/$/\nv/' "$location"/icons.wun
elif test "$a" = "Chance of Sleet"
then sed -i '14s/$/\nw/' "$location"/icons.wun
elif test "$a" = "Chance of Snow"
then sed -i '14s/$/\nq/' "$location"/icons.wun
elif test "$a" = "Chance of Thunderstorms"
then sed -i '14s/$/\nn/' "$location"/icons.wun
elif test "$a" = "Chance of a Thunderstorm"
then sed -i '14s/$/\nm/' "$location"/icons.wun
elif test "$a" = "Clear"
then sed -i '14s/$/\na/' "$location"/icons.wun
elif test "$a" = "Cloudy"
then sed -i '14s/$/\nd/' "$location"/icons.wun
elif test "$a" = "Flurries"
then sed -i '14s/$/\np/' "$location"/icons.wun
elif test "$a" = "Fog"
then sed -i '14s/$/\n0/' "$location"/icons.wun
elif test "$a" = "Haze"
then sed -i '14s/$/\n0/' "$location"/icons.wun
elif test "$a" = "Mostly Cloudy"
then sed -i '14s/$/\nc/' "$location"/icons.wun
elif test "$a" = "Mostly Sunny"
then sed -i '14s/$/\nb/' "$location"/icons.wun
elif test "$a" = "Partly Cloudy"
then sed -i '14s/$/\nc/' "$location"/icons.wun
elif test "$a" = "Partly Sunny"
then sed -i '14s/$/\nc/' "$location"/icons.wun
elif test "$a" = "Freezing Rain"
then sed -i '14s/$/\nv/' "$location"/icons.wun
elif test "$a" = "Rain"
then sed -i '14s/$/\ni/' "$location"/icons.wun
elif test "$a" = "Sleet"
then sed -i '14s/$/\nw/' "$location"/icons.wun
elif test "$a" = "Snow"
then sed -i '14s/$/\nr/' "$location"/icons.wun
elif test "$a" = "Sunny"
then sed -i '14s/$/\na/' "$location"/icons.wun
elif test "$a" = "Thunderstorms" || test "$a" = "Thunderstorm"
then sed -i '14s/$/\nn/' "$location"/icons.wun
elif test "$a" = "Overcast"
then sed -i '14s/$/\ne/' "$location"/icons.wun
elif test "$a" = "Scattered Clouds"
then sed -i '14s/$/\nb/' "$location"/icons.wun
else sed -i '14s/$/\n-/' "$location"/icons.wun
fi;
a=`sed -n '6p' "$location"/messages.wun`
if test "$a" = "Chance of Flurries"
then sed -i '15s/$/\nO/' "$location"/icons.wun
elif test "$a" = "Chance of Rain"
then sed -i '15s/$/\nG/' "$location"/icons.wun
elif test "$a" = "Chance of Freezing Rain" || test "$a" = "Light Freezing Rain"
then sed -i '15s/$/\nG/' "$location"/icons.wun
elif test "$a" = "Chance of Sleet"
then sed -i '15s/$/\nG/' "$location"/icons.wun
elif test "$a" = "Chance of Snow"
then sed -i '15s/$/\nO/' "$location"/icons.wun
elif test "$a" = "Chance of Thunderstorms"
then sed -i '15s/$/\nK/' "$location"/icons.wun
elif test "$a" = "Chance of a Thunderstorm"
then sed -i '15s/$/\nK/' "$location"/icons.wun
elif test "$a" = "Clear"
then sed -i '15s/$/\nA/' "$location"/icons.wun
elif test "$a" = "Cloudy"
then sed -i '15s/$/\nD/' "$location"/icons.wun
elif test "$a" = "Flurries"
then sed -i '15s/$/\nO/' "$location"/icons.wun
elif test "$a" = "Fog"
then sed -i '15s/$/\n0/' "$location"/icons.wun
elif test "$a" = "Haze"
then sed -i '15s/$/\n0/' "$location"/icons.wun
elif test "$a" = "Mostly Cloudy"
then sed -i '15s/$/\nC/' "$location"/icons.wun
elif test "$a" = "Mostly Sunny"
then sed -i '15s/$/\nB/' "$location"/icons.wun
elif test "$a" = "Partly Cloudy"
then sed -i '15s/$/\nC/' "$location"/icons.wun
elif test "$a" = "Partly Sunny"
then sed -i '15s/$/\nC/' "$location"/icons.wun
elif test "$a" = "Freezing Rain"
then sed -i '15s/$/\nG/' "$location"/icons.wun
elif test "$a" = "Rain"
then sed -i '15s/$/\nG/' "$location"/icons.wun
elif test "$a" = "Sleet"
then sed -i '15s/$/\nG/' "$location"/icons.wun
elif test "$a" = "Snow"
then sed -i '15s/$/\nO/' "$location"/icons.wun
elif test "$a" = "Sunny"
then sed -i '15s/$/\nA/' "$location"/icons.wun
elif test "$a" = "Thunderstorms" || test "$a" = "Thunderstorm"
then sed -i '15s/$/\nK/' "$location"/icons.wun
elif test "$a" = "Overcast"
then sed -i '15s/$/\nD/' "$location"/icons.wun
elif test "$a" = "Scattered Clouds"
then sed -i '15s/$/\nB/' "$location"/icons.wun
else sed -i '15s/$/\n-/' "$location"/icons.wun
fi;
a=`sed -n '10p' "$location"/messages.wun`
if test "$a" = "Chance of Flurries"
then sed -i '16s/$/\np/' "$location"/icons.wun
elif test "$a" = "Chance of Rain"
then sed -i '16s/$/\nh/' "$location"/icons.wun
elif test "$a" = "Chance of Freezing Rain" || test "$a" = "Light Freezing Rain"
then sed -i '16s/$/\nv/' "$location"/icons.wun
elif test "$a" = "Chance of Sleet"
then sed -i '16s/$/\nw/' "$location"/icons.wun
elif test "$a" = "Chance of Snow"
then sed -i '16s/$/\nq/' "$location"/icons.wun
elif test "$a" = "Chance of Thunderstorms"
then sed -i '16s/$/\nn/' "$location"/icons.wun
elif test "$a" = "Chance of a Thunderstorm"
then sed -i '16s/$/\nm/' "$location"/icons.wun
elif test "$a" = "Clear"
then sed -i '16s/$/\na/' "$location"/icons.wun
elif test "$a" = "Cloudy"
then sed -i '16s/$/\nd/' "$location"/icons.wun
elif test "$a" = "Flurries"
then sed -i '16s/$/\np/' "$location"/icons.wun
elif test "$a" = "Fog"
then sed -i '16s/$/\n0/' "$location"/icons.wun
elif test "$a" = "Haze"
then sed -i '16s/$/\n0/' "$location"/icons.wun
elif test "$a" = "Mostly Cloudy"
then sed -i '16s/$/\nc/' "$location"/icons.wun
elif test "$a" = "Mostly Sunny"
then sed -i '16s/$/\nb/' "$location"/icons.wun
elif test "$a" = "Partly Cloudy"
then sed -i '16s/$/\nc/' "$location"/icons.wun
elif test "$a" = "Partly Sunny"
then sed -i '16s/$/\nc/' "$location"/icons.wun
elif test "$a" = "Freezing Rain"
then sed -i '16s/$/\nv/' "$location"/icons.wun
elif test "$a" = "Rain"
then sed -i '16s/$/\ni/' "$location"/icons.wun
elif test "$a" = "Sleet"
then sed -i '16s/$/\nw/' "$location"/icons.wun
elif test "$a" = "Snow"
then sed -i '16s/$/\nr/' "$location"/icons.wun
elif test "$a" = "Sunny"
then sed -i '16s/$/\na/' "$location"/icons.wun
elif test "$a" = "Thunderstorms" || test "$a" = "Thunderstorm"
then sed -i '16s/$/\nn/' "$location"/icons.wun
elif test "$a" = "Overcast"
then sed -i '16s/$/\ne/' "$location"/icons.wun
elif test "$a" = "Scattered Clouds"
then sed -i '16s/$/\nb/' "$location"/icons.wun
else sed -i '16s/$/\n-/' "$location"/icons.wun
fi;
a=`sed -n '14p' "$location"/messages.wun`
if test "$a" = "Chance of Flurries"
then sed -i '17s/$/\nO/' "$location"/icons.wun
elif test "$a" = "Chance of Rain"
then sed -i '17s/$/\nG/' "$location"/icons.wun
elif test "$a" = "Chance of Freezing Rain" || test "$a" = "Light Freezing Rain"
then sed -i '17s/$/\nG/' "$location"/icons.wun
elif test "$a" = "Chance of Sleet"
then sed -i '17s/$/\nG/' "$location"/icons.wun
elif test "$a" = "Chance of Snow"
then sed -i '17s/$/\nO/' "$location"/icons.wun
elif test "$a" = "Chance of Thunderstorms"
then sed -i '17s/$/\nK/' "$location"/icons.wun
elif test "$a" = "Chance of a Thunderstorm"
then sed -i '17s/$/\nK/' "$location"/icons.wun
elif test "$a" = "Clear"
then sed -i '17s/$/\nA/' "$location"/icons.wun
elif test "$a" = "Cloudy"
then sed -i '17s/$/\nD/' "$location"/icons.wun
elif test "$a" = "Flurries"
then sed -i '17s/$/\nO/' "$location"/icons.wun
elif test "$a" = "Fog"
then sed -i '17s/$/\n0/' "$location"/icons.wun
elif test "$a" = "Haze"
then sed -i '17s/$/\n0/' "$location"/icons.wun
elif test "$a" = "Mostly Cloudy"
then sed -i '17s/$/\nC/' "$location"/icons.wun
elif test "$a" = "Mostly Sunny"
then sed -i '17s/$/\nB/' "$location"/icons.wun
elif test "$a" = "Partly Cloudy"
then sed -i '17s/$/\nC/' "$location"/icons.wun
elif test "$a" = "Partly Sunny"
then sed -i '17s/$/\nC/' "$location"/icons.wun
elif test "$a" = "Freezing Rain"
then sed -i '17s/$/\nG/' "$location"/icons.wun
elif test "$a" = "Rain"
then sed -i '17s/$/\nG/' "$location"/icons.wun
elif test "$a" = "Sleet"
then sed -i '17s/$/\nG/' "$location"/icons.wun
elif test "$a" = "Snow"
then sed -i '17s/$/\nO/' "$location"/icons.wun
elif test "$a" = "Sunny"
then sed -i '17s/$/\nA/' "$location"/icons.wun
elif test "$a" = "Thunderstorms" || test "$a" = "Thunderstorm"
then sed -i '17s/$/\nK/' "$location"/icons.wun
elif test "$a" = "Overcast"
then sed -i '17s/$/\nD/' "$location"/icons.wun
elif test "$a" = "Scattered Clouds"
then sed -i '17s/$/\nB/' "$location"/icons.wun
else sed -i '17s/$/\n-/' "$location"/icons.wun
fi;
a=`sed -n '18p' "$location"/messages.wun`
if test "$a" = "Chance of Flurries"
then sed -i '18s/$/\np/' "$location"/icons.wun
elif test "$a" = "Chance of Rain"
then sed -i '18s/$/\nh/' "$location"/icons.wun
elif test "$a" = "Chance of Freezing Rain" || test "$a" = "Light Freezing Rain"
then sed -i '18s/$/\nv/' "$location"/icons.wun
elif test "$a" = "Chance of Sleet"
then sed -i '18s/$/\nw/' "$location"/icons.wun
elif test "$a" = "Chance of Snow"
then sed -i '18s/$/\nq/' "$location"/icons.wun
elif test "$a" = "Chance of Thunderstorms"
then sed -i '18s/$/\nn/' "$location"/icons.wun
elif test "$a" = "Chance of a Thunderstorm"
then sed -i '18s/$/\nm/' "$location"/icons.wun
elif test "$a" = "Clear"
then sed -i '18s/$/\na/' "$location"/icons.wun
elif test "$a" = "Cloudy"
then sed -i '18s/$/\nd/' "$location"/icons.wun
elif test "$a" = "Flurries"
then sed -i '18s/$/\np/' "$location"/icons.wun
elif test "$a" = "Fog"
then sed -i '18s/$/\n0/' "$location"/icons.wun
elif test "$a" = "Haze"
then sed -i '18s/$/\n0/' "$location"/icons.wun
elif test "$a" = "Mostly Cloudy"
then sed -i '18s/$/\nc/' "$location"/icons.wun
elif test "$a" = "Mostly Sunny"
then sed -i '18s/$/\nb/' "$location"/icons.wun
elif test "$a" = "Partly Cloudy"
then sed -i '18s/$/\nc/' "$location"/icons.wun
elif test "$a" = "Partly Sunny"
then sed -i '18s/$/\nc/' "$location"/icons.wun
elif test "$a" = "Freezing Rain"
then sed -i '18s/$/\nv/' "$location"/icons.wun
elif test "$a" = "Rain"
then sed -i '18s/$/\ni/' "$location"/icons.wun
elif test "$a" = "Sleet"
then sed -i '18s/$/\nw/' "$location"/icons.wun
elif test "$a" = "Snow"
then sed -i '18s/$/\nr/' "$location"/icons.wun
elif test "$a" = "Sunny"
then sed -i '18s/$/\na/' "$location"/icons.wun
elif test "$a" = "Thunderstorms" || test "$a" = "Thunderstorm"
then sed -i '18s/$/\nn/' "$location"/icons.wun
elif test "$a" = "Overcast"
then sed -i '18s/$/\ne/' "$location"/icons.wun
elif test "$a" = "Scattered Clouds"
then sed -i '18s/$/\nb/' "$location"/icons.wun
else sed -i '18s/$/\n-/' "$location"/icons.wun
fi;
a=`sed -n '22p' "$location"/messages.wun`
if test "$a" = "Chance of Flurries"
then sed -i '19s/$/\nO/' "$location"/icons.wun
elif test "$a" = "Chance of Rain"
then sed -i '19s/$/\nG/' "$location"/icons.wun
elif test "$a" = "Chance of Freezing Rain" || test "$a" = "Light Freezing Rain"
then sed -i '19s/$/\nG/' "$location"/icons.wun
elif test "$a" = "Chance of Sleet"
then sed -i '19s/$/\nG/' "$location"/icons.wun
elif test "$a" = "Chance of Snow"
then sed -i '19s/$/\nO/' "$location"/icons.wun
elif test "$a" = "Chance of Thunderstorms"
then sed -i '19s/$/\nK/' "$location"/icons.wun
elif test "$a" = "Chance of a Thunderstorm"
then sed -i '19s/$/\nK/' "$location"/icons.wun
elif test "$a" = "Clear"
then sed -i '19s/$/\nA/' "$location"/icons.wun
elif test "$a" = "Cloudy"
then sed -i '19s/$/\nD/' "$location"/icons.wun
elif test "$a" = "Flurries"
then sed -i '19s/$/\nO/' "$location"/icons.wun
elif test "$a" = "Fog"
then sed -i '19s/$/\n0/' "$location"/icons.wun
elif test "$a" = "Haze"
then sed -i '19s/$/\n0/' "$location"/icons.wun
elif test "$a" = "Mostly Cloudy"
then sed -i '19s/$/\nC/' "$location"/icons.wun
elif test "$a" = "Mostly Sunny"
then sed -i '19s/$/\nB/' "$location"/icons.wun
elif test "$a" = "Partly Cloudy"
then sed -i '19s/$/\nC/' "$location"/icons.wun
elif test "$a" = "Partly Sunny"
then sed -i '19s/$/\nC/' "$location"/icons.wun
elif test "$a" = "Freezing Rain"
then sed -i '19s/$/\nG/' "$location"/icons.wun
elif test "$a" = "Rain"
then sed -i '19s/$/\nG/' "$location"/icons.wun
elif test "$a" = "Sleet"
then sed -i '19s/$/\nG/' "$location"/icons.wun
elif test "$a" = "Snow"
then sed -i '19s/$/\nO/' "$location"/icons.wun
elif test "$a" = "Sunny"
then sed -i '19s/$/\nA/' "$location"/icons.wun
elif test "$a" = "Thunderstorms" || test "$a" = "Thunderstorm"
then sed -i '19s/$/\nK/' "$location"/icons.wun
elif test "$a" = "Overcast"
then sed -i '19s/$/\nD/' "$location"/icons.wun
elif test "$a" = "Scattered Clouds"
then sed -i '19s/$/\nB/' "$location"/icons.wun
else sed -i '19s/$/\n-/' "$location"/icons.wun
fi;
a=`sed -n '26p' "$location"/messages.wun`
if test "$a" = "Chance of Flurries"
then sed -i '20s/$/\np/' "$location"/icons.wun
elif test "$a" = "Chance of Rain"
then sed -i '20s/$/\nh/' "$location"/icons.wun
elif test "$a" = "Chance of Freezing Rain" || test "$a" = "Light Freezing Rain"
then sed -i '20s/$/\nv/' "$location"/icons.wun
elif test "$a" = "Chance of Sleet"
then sed -i '20s/$/\nw/' "$location"/icons.wun
elif test "$a" = "Chance of Snow"
then sed -i '20s/$/\nq/' "$location"/icons.wun
elif test "$a" = "Chance of Thunderstorms"
then sed -i '20s/$/\nn/' "$location"/icons.wun
elif test "$a" = "Chance of a Thunderstorm"
then sed -i '20s/$/\nm/' "$location"/icons.wun
elif test "$a" = "Clear"
then sed -i '20s/$/\na/' "$location"/icons.wun
elif test "$a" = "Cloudy"
then sed -i '20s/$/\nd/' "$location"/icons.wun
elif test "$a" = "Flurries"
then sed -i '20s/$/\np/' "$location"/icons.wun
elif test "$a" = "Fog"
then sed -i '20s/$/\n0/' "$location"/icons.wun
elif test "$a" = "Haze"
then sed -i '20s/$/\n0/' "$location"/icons.wun
elif test "$a" = "Mostly Cloudy"
then sed -i '20s/$/\nc/' "$location"/icons.wun
elif test "$a" = "Mostly Sunny"
then sed -i '20s/$/\nb/' "$location"/icons.wun
elif test "$a" = "Partly Cloudy"
then sed -i '20s/$/\nc/' "$location"/icons.wun
elif test "$a" = "Partly Sunny"
then sed -i '20s/$/\nc/' "$location"/icons.wun
elif test "$a" = "Freezing Rain"
then sed -i '20s/$/\nv/' "$location"/icons.wun
elif test "$a" = "Rain"
then sed -i '20s/$/\ni/' "$location"/icons.wun
elif test "$a" = "Sleet"
then sed -i '20s/$/\nw/' "$location"/icons.wun
elif test "$a" = "Snow"
then sed -i '20s/$/\nr/' "$location"/icons.wun
elif test "$a" = "Sunny"
then sed -i '20s/$/\na/' "$location"/icons.wun
elif test "$a" = "Thunderstorms" || test "$a" = "Thunderstorm"
then sed -i '20s/$/\nn/' "$location"/icons.wun
elif test "$a" = "Overcast"
then sed -i '20s/$/\ne/' "$location"/icons.wun
elif test "$a" = "Scattered Clouds"
then sed -i '20s/$/\nb/' "$location"/icons.wun
else sed -i '20s/$/\n-/' "$location"/icons.wun
fi;
a=`sed -n '30p' "$location"/messages.wun`
if test "$a" = "Chance of Flurries"
then sed -i '21s/$/\nO/' "$location"/icons.wun
elif test "$a" = "Chance of Rain"
then sed -i '21s/$/\nG/' "$location"/icons.wun
elif test "$a" = "Chance of Freezing Rain" || test "$a" = "Light Freezing Rain"
then sed -i '21s/$/\nG/' "$location"/icons.wun
elif test "$a" = "Chance of Sleet"
then sed -i '21s/$/\nG/' "$location"/icons.wun
elif test "$a" = "Chance of Snow"
then sed -i '21s/$/\nO/' "$location"/icons.wun
elif test "$a" = "Chance of Thunderstorms"
then sed -i '21s/$/\nK/' "$location"/icons.wun
elif test "$a" = "Chance of a Thunderstorm"
then sed -i '21s/$/\nK/' "$location"/icons.wun
elif test "$a" = "Clear"
then sed -i '21s/$/\nA/' "$location"/icons.wun
elif test "$a" = "Cloudy"
then sed -i '21s/$/\nD/' "$location"/icons.wun
elif test "$a" = "Flurries"
then sed -i '21s/$/\nO/' "$location"/icons.wun
elif test "$a" = "Fog"
then sed -i '21s/$/\n0/' "$location"/icons.wun
elif test "$a" = "Haze"
then sed -i '21s/$/\n0/' "$location"/icons.wun
elif test "$a" = "Mostly Cloudy"
then sed -i '21s/$/\nC/' "$location"/icons.wun
elif test "$a" = "Mostly Sunny"
then sed -i '21s/$/\nB/' "$location"/icons.wun
elif test "$a" = "Partly Cloudy"
then sed -i '21s/$/\nC/' "$location"/icons.wun
elif test "$a" = "Partly Sunny"
then sed -i '21s/$/\nC/' "$location"/icons.wun
elif test "$a" = "Freezing Rain"
then sed -i '21s/$/\nG/' "$location"/icons.wun
elif test "$a" = "Rain"
then sed -i '21s/$/\nG/' "$location"/icons.wun
elif test "$a" = "Sleet"
then sed -i '21s/$/\nG/' "$location"/icons.wun
elif test "$a" = "Snow"
then sed -i '21s/$/\nO/' "$location"/icons.wun
elif test "$a" = "Sunny"
then sed -i '21s/$/\nA/' "$location"/icons.wun
elif test "$a" = "Thunderstorms" || test "$a" = "Thunderstorm"
then sed -i '21s/$/\nK/' "$location"/icons.wun
elif test "$a" = "Overcast"
then sed -i '21s/$/\nD/' "$location"/icons.wun
elif test "$a" = "Scattered Clouds"
then sed -i '21s/$/\nB/' "$location"/icons.wun
else sed -i '21s/$/\n-/' "$location"/icons.wun
fi;
a=`sed -n '34p' "$location"/messages.wun`
if test "$a" = "Chance of Flurries"
then sed -i '22s/$/\np/' "$location"/icons.wun
elif test "$a" = "Chance of Rain"
then sed -i '22s/$/\nh/' "$location"/icons.wun
elif test "$a" = "Chance of Freezing Rain" || test "$a" = "Light Freezing Rain"
then sed -i '22s/$/\nv/' "$location"/icons.wun
elif test "$a" = "Chance of Sleet"
then sed -i '22s/$/\nw/' "$location"/icons.wun
elif test "$a" = "Chance of Snow"
then sed -i '22s/$/\nq/' "$location"/icons.wun
elif test "$a" = "Chance of Thunderstorms"
then sed -i '22s/$/\nn/' "$location"/icons.wun
elif test "$a" = "Chance of a Thunderstorm"
then sed -i '22s/$/\nm/' "$location"/icons.wun
elif test "$a" = "Clear"
then sed -i '22s/$/\na/' "$location"/icons.wun
elif test "$a" = "Cloudy"
then sed -i '22s/$/\nd/' "$location"/icons.wun
elif test "$a" = "Flurries"
then sed -i '22s/$/\np/' "$location"/icons.wun
elif test "$a" = "Fog"
then sed -i '22s/$/\n0/' "$location"/icons.wun
elif test "$a" = "Haze"
then sed -i '22s/$/\n0/' "$location"/icons.wun
elif test "$a" = "Mostly Cloudy"
then sed -i '22s/$/\nc/' "$location"/icons.wun
elif test "$a" = "Mostly Sunny"
then sed -i '22s/$/\nb/' "$location"/icons.wun
elif test "$a" = "Partly Cloudy"
then sed -i '22s/$/\nc/' "$location"/icons.wun
elif test "$a" = "Partly Sunny"
then sed -i '22s/$/\nc/' "$location"/icons.wun
elif test "$a" = "Freezing Rain"
then sed -i '22s/$/\nv/' "$location"/icons.wun
elif test "$a" = "Rain"
then sed -i '22s/$/\ni/' "$location"/icons.wun
elif test "$a" = "Sleet"
then sed -i '22s/$/\nw/' "$location"/icons.wun
elif test "$a" = "Snow"
then sed -i '22s/$/\nr/' "$location"/icons.wun
elif test "$a" = "Sunny"
then sed -i '22s/$/\na/' "$location"/icons.wun
elif test "$a" = "Thunderstorms" || test "$a" = "Thunderstorm"
then sed -i '22s/$/\nn/' "$location"/icons.wun
elif test "$a" = "Overcast"
then sed -i '22s/$/\ne/' "$location"/icons.wun
elif test "$a" = "Scattered Clouds"
then sed -i '22s/$/\nb/' "$location"/icons.wun
else sed -i '22s/$/\n-/' "$location"/icons.wun
fi;
a=`sed -n '38p' "$location"/messages.wun`
if test "$a" = "Chance of Flurries"
then sed -i '23s/$/\nO/' "$location"/icons.wun
elif test "$a" = "Chance of Rain"
then sed -i '23s/$/\nG/' "$location"/icons.wun
elif test "$a" = "Chance of Freezing Rain" || test "$a" = "Light Freezing Rain"
then sed -i '23s/$/\nG/' "$location"/icons.wun
elif test "$a" = "Chance of Sleet"
then sed -i '23s/$/\nG/' "$location"/icons.wun
elif test "$a" = "Chance of Snow"
then sed -i '23s/$/\nO/' "$location"/icons.wun
elif test "$a" = "Chance of Thunderstorms"
then sed -i '23s/$/\nK/' "$location"/icons.wun
elif test "$a" = "Chance of a Thunderstorm"
then sed -i '23s/$/\nK/' "$location"/icons.wun
elif test "$a" = "Clear"
then sed -i '23s/$/\nA/' "$location"/icons.wun
elif test "$a" = "Cloudy"
then sed -i '23s/$/\nD/' "$location"/icons.wun
elif test "$a" = "Flurries"
then sed -i '23s/$/\nO/' "$location"/icons.wun
elif test "$a" = "Fog"
then sed -i '23s/$/\n0/' "$location"/icons.wun
elif test "$a" = "Haze"
then sed -i '23s/$/\n0/' "$location"/icons.wun
elif test "$a" = "Mostly Cloudy"
then sed -i '23s/$/\nC/' "$location"/icons.wun
elif test "$a" = "Mostly Sunny"
then sed -i '23s/$/\nB/' "$location"/icons.wun
elif test "$a" = "Partly Cloudy"
then sed -i '23s/$/\nC/' "$location"/icons.wun
elif test "$a" = "Partly Sunny"
then sed -i '23s/$/\nC/' "$location"/icons.wun
elif test "$a" = "Freezing Rain"
then sed -i '23s/$/\nG/' "$location"/icons.wun
elif test "$a" = "Rain"
then sed -i '23s/$/\nG/' "$location"/icons.wun
elif test "$a" = "Sleet"
then sed -i '23s/$/\nG/' "$location"/icons.wun
elif test "$a" = "Snow"
then sed -i '23s/$/\nO/' "$location"/icons.wun
elif test "$a" = "Sunny"
then sed -i '23s/$/\nA/' "$location"/icons.wun
elif test "$a" = "Thunderstorms" || test "$a" = "Thunderstorm"
then sed -i '23s/$/\nK/' "$location"/icons.wun
elif test "$a" = "Overcast"
then sed -i '23s/$/\nD/' "$location"/icons.wun
elif test "$a" = "Scattered Clouds"
then sed -i '23s/$/\nB/' "$location"/icons.wun
else sed -i '23s/$/\n-/' "$location"/icons.wun
fi;
a=`sed -n '42p' "$location"/messages.wun`
if test "$a" = "Chance of Flurries"
then sed -i '24s/$/\np/' "$location"/icons.wun
elif test "$a" = "Chance of Rain"
then sed -i '24s/$/\nh/' "$location"/icons.wun
elif test "$a" = "Chance of Freezing Rain" || test "$a" = "Light Freezing Rain"
then sed -i '24s/$/\nv/' "$location"/icons.wun
elif test "$a" = "Chance of Sleet"
then sed -i '24s/$/\nw/' "$location"/icons.wun
elif test "$a" = "Chance of Snow"
then sed -i '24s/$/\nq/' "$location"/icons.wun
elif test "$a" = "Chance of Thunderstorms"
then sed -i '24s/$/\nn/' "$location"/icons.wun
elif test "$a" = "Chance of a Thunderstorm"
then sed -i '24s/$/\nm/' "$location"/icons.wun
elif test "$a" = "Clear"
then sed -i '24s/$/\na/' "$location"/icons.wun
elif test "$a" = "Cloudy"
then sed -i '24s/$/\nd/' "$location"/icons.wun
elif test "$a" = "Flurries"
then sed -i '24s/$/\np/' "$location"/icons.wun
elif test "$a" = "Fog"
then sed -i '24s/$/\n0/' "$location"/icons.wun
elif test "$a" = "Haze"
then sed -i '24s/$/\n0/' "$location"/icons.wun
elif test "$a" = "Mostly Cloudy"
then sed -i '24s/$/\nc/' "$location"/icons.wun
elif test "$a" = "Mostly Sunny"
then sed -i '24s/$/\nb/' "$location"/icons.wun
elif test "$a" = "Partly Cloudy"
then sed -i '24s/$/\nc/' "$location"/icons.wun
elif test "$a" = "Partly Sunny"
then sed -i '24s/$/\nc/' "$location"/icons.wun
elif test "$a" = "Freezing Rain"
then sed -i '24s/$/\nv/' "$location"/icons.wun
elif test "$a" = "Rain"
then sed -i '24s/$/\ni/' "$location"/icons.wun
elif test "$a" = "Sleet"
then sed -i '24s/$/\nw/' "$location"/icons.wun
elif test "$a" = "Snow"
then sed -i '24s/$/\nr/' "$location"/icons.wun
elif test "$a" = "Sunny"
then sed -i '24s/$/\na/' "$location"/icons.wun
elif test "$a" = "Thunderstorms" || test "$a" = "Thunderstorm"
then sed -i '24s/$/\nn/' "$location"/icons.wun
elif test "$a" = "Overcast"
then sed -i '24s/$/\ne/' "$location"/icons.wun
elif test "$a" = "Scattered Clouds"
then sed -i '24s/$/\nb/' "$location"/icons.wun
else sed -i '24s/$/\n-/' "$location"/icons.wun
fi;
a=`sed -n '46p' "$location"/messages.wun`
if test "$a" = "Chance of Flurries"
then sed -i '25s/$/\nO/' "$location"/icons.wun
elif test "$a" = "Chance of Rain"
then sed -i '25s/$/\nG/' "$location"/icons.wun
elif test "$a" = "Chance of Freezing Rain" || test "$a" = "Light Freezing Rain"
then sed -i '25s/$/\nG/' "$location"/icons.wun
elif test "$a" = "Chance of Sleet"
then sed -i '25s/$/\nG/' "$location"/icons.wun
elif test "$a" = "Chance of Snow"
then sed -i '25s/$/\nO/' "$location"/icons.wun
elif test "$a" = "Chance of Thunderstorms"
then sed -i '25s/$/\nK/' "$location"/icons.wun
elif test "$a" = "Chance of a Thunderstorm"
then sed -i '25s/$/\nK/' "$location"/icons.wun
elif test "$a" = "Clear"
then sed -i '25s/$/\nA/' "$location"/icons.wun
elif test "$a" = "Cloudy"
then sed -i '25s/$/\nD/' "$location"/icons.wun
elif test "$a" = "Flurries"
then sed -i '25s/$/\nO/' "$location"/icons.wun
elif test "$a" = "Fog"
then sed -i '25s/$/\n0/' "$location"/icons.wun
elif test "$a" = "Haze"
then sed -i '25s/$/\n0/' "$location"/icons.wun
elif test "$a" = "Mostly Cloudy"
then sed -i '25s/$/\nC/' "$location"/icons.wun
elif test "$a" = "Mostly Sunny"
then sed -i '25s/$/\nB/' "$location"/icons.wun
elif test "$a" = "Partly Cloudy"
then sed -i '25s/$/\nC/' "$location"/icons.wun
elif test "$a" = "Partly Sunny"
then sed -i '25s/$/\nC/' "$location"/icons.wun
elif test "$a" = "Freezing Rain"
then sed -i '25s/$/\nG/' "$location"/icons.wun
elif test "$a" = "Rain"
then sed -i '25s/$/\nG/' "$location"/icons.wun
elif test "$a" = "Sleet"
then sed -i '25s/$/\nG/' "$location"/icons.wun
elif test "$a" = "Snow"
then sed -i '25s/$/\nO/' "$location"/icons.wun
elif test "$a" = "Sunny"
then sed -i '25s/$/\nA/' "$location"/icons.wun
elif test "$a" = "Thunderstorms" || test "$a" = "Thunderstorm"
then sed -i '25s/$/\nK/' "$location"/icons.wun
elif test "$a" = "Overcast"
then sed -i '25s/$/\nD/' "$location"/icons.wun
elif test "$a" = "Scattered Clouds"
then sed -i '25s/$/\nB/' "$location"/icons.wun
else sed -i '25s/$/\n-/' "$location"/icons.wun
fi;
a=`sed -n '50p' "$location"/messages.wun`
if test "$a" = "Chance of Flurries"
then sed -i '26s/$/\np/' "$location"/icons.wun
elif test "$a" = "Chance of Rain"
then sed -i '26s/$/\nh/' "$location"/icons.wun
elif test "$a" = "Chance of Freezing Rain" || test "$a" = "Light Freezing Rain"
then sed -i '26s/$/\nv/' "$location"/icons.wun
elif test "$a" = "Chance of Sleet"
then sed -i '26s/$/\nw/' "$location"/icons.wun
elif test "$a" = "Chance of Snow"
then sed -i '26s/$/\nq/' "$location"/icons.wun
elif test "$a" = "Chance of Thunderstorms"
then sed -i '26s/$/\nn/' "$location"/icons.wun
elif test "$a" = "Chance of a Thunderstorm"
then sed -i '26s/$/\nm/' "$location"/icons.wun
elif test "$a" = "Clear"
then sed -i '26s/$/\na/' "$location"/icons.wun
elif test "$a" = "Cloudy"
then sed -i '26s/$/\nd/' "$location"/icons.wun
elif test "$a" = "Flurries"
then sed -i '26s/$/\np/' "$location"/icons.wun
elif test "$a" = "Fog"
then sed -i '26s/$/\n0/' "$location"/icons.wun
elif test "$a" = "Haze"
then sed -i '26s/$/\n0/' "$location"/icons.wun
elif test "$a" = "Mostly Cloudy"
then sed -i '26s/$/\nc/' "$location"/icons.wun
elif test "$a" = "Mostly Sunny"
then sed -i '26s/$/\nb/' "$location"/icons.wun
elif test "$a" = "Partly Cloudy"
then sed -i '26s/$/\nc/' "$location"/icons.wun
elif test "$a" = "Partly Sunny"
then sed -i '26s/$/\nc/' "$location"/icons.wun
elif test "$a" = "Freezing Rain"
then sed -i '26s/$/\nv/' "$location"/icons.wun
elif test "$a" = "Rain"
then sed -i '26s/$/\ni/' "$location"/icons.wun
elif test "$a" = "Sleet"
then sed -i '26s/$/\nw/' "$location"/icons.wun
elif test "$a" = "Snow"
then sed -i '26s/$/\nr/' "$location"/icons.wun
elif test "$a" = "Sunny"
then sed -i '26s/$/\na/' "$location"/icons.wun
elif test "$a" = "Thunderstorms" || test "$a" = "Thunderstorm"
then sed -i '26s/$/\nn/' "$location"/icons.wun
elif test "$a" = "Overcast"
then sed -i '26s/$/\ne/' "$location"/icons.wun
elif test "$a" = "Scattered Clouds"
then sed -i '26s/$/\nb/' "$location"/icons.wun
else sed -i '26s/$/\n-/' "$location"/icons.wun
fi;
a=`sed -n '54p' "$location"/messages.wun`
if test "$a" = "Chance of Flurries"
then sed -i '27s/$/\nO/' "$location"/icons.wun
elif test "$a" = "Chance of Rain"
then sed -i '27s/$/\nG/' "$location"/icons.wun
elif test "$a" = "Chance of Freezing Rain" || test "$a" = "Light Freezing Rain"
then sed -i '27s/$/\nG/' "$location"/icons.wun
elif test "$a" = "Chance of Sleet"
then sed -i '27s/$/\nG/' "$location"/icons.wun
elif test "$a" = "Chance of Snow"
then sed -i '27s/$/\nO/' "$location"/icons.wun
elif test "$a" = "Chance of Thunderstorms"
then sed -i '27s/$/\nK/' "$location"/icons.wun
elif test "$a" = "Chance of a Thunderstorm"
then sed -i '27s/$/\nK/' "$location"/icons.wun
elif test "$a" = "Clear"
then sed -i '27s/$/\nA/' "$location"/icons.wun
elif test "$a" = "Cloudy"
then sed -i '27s/$/\nD/' "$location"/icons.wun
elif test "$a" = "Flurries"
then sed -i '27s/$/\nO/' "$location"/icons.wun
elif test "$a" = "Fog"
then sed -i '27s/$/\n0/' "$location"/icons.wun
elif test "$a" = "Haze"
then sed -i '27s/$/\n0/' "$location"/icons.wun
elif test "$a" = "Mostly Cloudy"
then sed -i '27s/$/\nC/' "$location"/icons.wun
elif test "$a" = "Mostly Sunny"
then sed -i '27s/$/\nB/' "$location"/icons.wun
elif test "$a" = "Partly Cloudy"
then sed -i '27s/$/\nC/' "$location"/icons.wun
elif test "$a" = "Partly Sunny"
then sed -i '27s/$/\nC/' "$location"/icons.wun
elif test "$a" = "Freezing Rain"
then sed -i '27s/$/\nG/' "$location"/icons.wun
elif test "$a" = "Rain"
then sed -i '27s/$/\nG/' "$location"/icons.wun
elif test "$a" = "Sleet"
then sed -i '27s/$/\nG/' "$location"/icons.wun
elif test "$a" = "Snow"
then sed -i '27s/$/\nO/' "$location"/icons.wun
elif test "$a" = "Sunny"
then sed -i '27s/$/\nA/' "$location"/icons.wun
elif test "$a" = "Thunderstorms" || test "$a" = "Thunderstorm"
then sed -i '27s/$/\nK/' "$location"/icons.wun
elif test "$a" = "Overcast"
then sed -i '27s/$/\nD/' "$location"/icons.wun
elif test "$a" = "Scattered Clouds"
then sed -i '27s/$/\nB/' "$location"/icons.wun
else sed -i '27s/$/\n-/' "$location"/icons.wun
fi;
a=`sed -n '4p' "$location"/messages.wun|cut -c1-3 `
if test "$a" = "Sou"
then sed -i '1s/Sou/1/g' "$location"/icons.wun
elif test "$a" = "SSW"
then sed -i '1s/SSW/2/g' "$location"/icons.wun
elif test "$a" = "SW "
then sed -i '1s/SW /3/g' "$location"/icons.wun
elif test "$a" = "WSW"
then sed -i '1s/WSW/4/g' "$location"/icons.wun
elif test "$a" = "Wes"
then sed -i '1s/Wes/5/g' "$location"/icons.wun
elif test "$a" = "WNW"
then sed -i '1s/WNW/6/g' "$location"/icons.wun
elif test "$a" = "NW "
then sed -i '1s/NW /7/g' "$location"/icons.wun
elif test "$a" = "NNW"
then sed -i '1s/NNW/8/g' "$location"/icons.wun
elif test "$a" = "Nor"
then sed -i '1s/Nor/9/g' "$location"/icons.wun
elif test "$a" = "NNE"
then sed -i '1s/NNE/:/g' "$location"/icons.wun
elif test "$a" = "NE "
then sed -i '1s/NE /;/g' "$location"/icons.wun
elif test "$a" = "ENE"
then sed -i '1s/ENE/</g' "$location"/icons.wun
elif test "$a" = "Eas"
then sed -i '1s/Eas/=/g' "$location"/icons.wun
elif test "$a" = "ESE"
then sed -i '1s/ESE/>/g' "$location"/icons.wun
elif test "$a" = "SE "
then sed -i '1s/SE /?/g' "$location"/icons.wun
elif test "$a" = "SSE"
then sed -i '1s/SSE/@/g' "$location"/icons.wun
else sed -i '1s/$/-/' "$location"/icons.wun
fi;
a=`sed -n '8p' "$location"/messages.wun|cut -c1-3 `
if test "$a" = "Sou"
then sed -i '2s/Sou/1/g' "$location"/icons.wun
elif test "$a" = "SSW"
then sed -i '2s/SSW/2/g' "$location"/icons.wun
elif test "$a" = "SW "
then sed -i '2s/SW /3/g' "$location"/icons.wun
elif test "$a" = "WSW"
then sed -i '2s/WSW/4/g' "$location"/icons.wun
elif test "$a" = "Wes"
then sed -i '2s/Wes/5/g' "$location"/icons.wun
elif test "$a" = "WNW"
then sed -i '2s/WNW/6/g' "$location"/icons.wun
elif test "$a" = "NW "
then sed -i '2s/NW /7/g' "$location"/icons.wun
elif test "$a" = "NNW"
then sed -i '2s/NNW/8/g' "$location"/icons.wun
elif test "$a" = "Nor"
then sed -i '2s/Nor/9/g' "$location"/icons.wun
elif test "$a" = "NNE"
then sed -i '2s/NNE/:/g' "$location"/icons.wun
elif test "$a" = "NE "
then sed -i '2s/NE /;/g' "$location"/icons.wun
elif test "$a" = "ENE"
then sed -i '2s/ENE/</g' "$location"/icons.wun
elif test "$a" = "Eas"
then sed -i '2s/Eas/=/g' "$location"/icons.wun
elif test "$a" = "ESE"
then sed -i '2s/ESE/>/g' "$location"/icons.wun
elif test "$a" = "SE "
then sed -i '2s/SE /?/g' "$location"/icons.wun
elif test "$a" = "SSE"
then sed -i '2s/SSE/@/g' "$location"/icons.wun
else sed -i '2s/$/-/' "$location"/icons.wun
fi;
a=`sed -n '12p' "$location"/messages.wun|cut -c1-3 `
if test "$a" = "Sou"
then sed -i '3s/Sou/1/g' "$location"/icons.wun
elif test "$a" = "SSW"
then sed -i '3s/SSW/2/g' "$location"/icons.wun
elif test "$a" = "SW "
then sed -i '3s/SW /3/g' "$location"/icons.wun
elif test "$a" = "WSW"
then sed -i '3s/WSW/4/g' "$location"/icons.wun
elif test "$a" = "Wes"
then sed -i '3s/Wes/5/g' "$location"/icons.wun
elif test "$a" = "WNW"
then sed -i '3s/WNW/6/g' "$location"/icons.wun
elif test "$a" = "NW "
then sed -i '3s/NW /7/g' "$location"/icons.wun
elif test "$a" = "NNW"
then sed -i '3s/NNW/8/g' "$location"/icons.wun
elif test "$a" = "Nor"
then sed -i '3s/Nor/9/g' "$location"/icons.wun
elif test "$a" = "NNE"
then sed -i '3s/NNE/:/g' "$location"/icons.wun
elif test "$a" = "NE "
then sed -i '3s/NE /;/g' "$location"/icons.wun
elif test "$a" = "ENE"
then sed -i '3s/ENE/</g' "$location"/icons.wun
elif test "$a" = "Eas"
then sed -i '3s/Eas/=/g' "$location"/icons.wun
elif test "$a" = "ESE"
then sed -i '3s/ESE/>/g' "$location"/icons.wun
elif test "$a" = "SE "
then sed -i '3s/SE /?/g' "$location"/icons.wun
elif test "$a" = "SSE"
then sed -i '3s/SSE/@/g' "$location"/icons.wun
else sed -i '3s/$/-/' "$location"/icons.wun
fi;
a=`sed -n '16p' "$location"/messages.wun|cut -c1-3 `
if test "$a" = "Sou"
then sed -i '4s/Sou/1/g' "$location"/icons.wun
elif test "$a" = "SSW"
then sed -i '4s/SSW/2/g' "$location"/icons.wun
elif test "$a" = "SW "
then sed -i '4s/SW /3/g' "$location"/icons.wun
elif test "$a" = "WSW"
then sed -i '4s/WSW/4/g' "$location"/icons.wun
elif test "$a" = "Wes"
then sed -i '4s/Wes/5/g' "$location"/icons.wun
elif test "$a" = "WNW"
then sed -i '4s/WNW/6/g' "$location"/icons.wun
elif test "$a" = "NW "
then sed -i '4s/NW /7/g' "$location"/icons.wun
elif test "$a" = "NNW"
then sed -i '4s/NNW/8/g' "$location"/icons.wun
elif test "$a" = "Nor"
then sed -i '4s/Nor/9/g' "$location"/icons.wun
elif test "$a" = "NNE"
then sed -i '4s/NNE/:/g' "$location"/icons.wun
elif test "$a" = "NE "
then sed -i '4s/NE /;/g' "$location"/icons.wun
elif test "$a" = "ENE"
then sed -i '4s/ENE/</g' "$location"/icons.wun
elif test "$a" = "Eas"
then sed -i '4s/Eas/=/g' "$location"/icons.wun
elif test "$a" = "ESE"
then sed -i '4s/ESE/>/g' "$location"/icons.wun
elif test "$a" = "SE "
then sed -i '4s/SE /?/g' "$location"/icons.wun
elif test "$a" = "SSE"
then sed -i '4s/SSE/@/g' "$location"/icons.wun
else sed -i '4s/$/-/' "$location"/icons.wun
fi;
a=`sed -n '20p' "$location"/messages.wun|cut -c1-3 `
if test "$a" = "Sou"
then sed -i '5s/Sou/1/g' "$location"/icons.wun
elif test "$a" = "SSW"
then sed -i '5s/SSW/2/g' "$location"/icons.wun
elif test "$a" = "SW "
then sed -i '5s/SW /3/g' "$location"/icons.wun
elif test "$a" = "WSW"
then sed -i '5s/WSW/4/g' "$location"/icons.wun
elif test "$a" = "Wes"
then sed -i '5s/Wes/5/g' "$location"/icons.wun
elif test "$a" = "WNW"
then sed -i '5s/WNW/6/g' "$location"/icons.wun
elif test "$a" = "NW "
then sed -i '5s/NW /7/g' "$location"/icons.wun
elif test "$a" = "NNW"
then sed -i '5s/NNW/8/g' "$location"/icons.wun
elif test "$a" = "Nor"
then sed -i '5s/Nor/9/g' "$location"/icons.wun
elif test "$a" = "NNE"
then sed -i '5s/NNE/:/g' "$location"/icons.wun
elif test "$a" = "NE "
then sed -i '5s/NE /;/g' "$location"/icons.wun
elif test "$a" = "ENE"
then sed -i '5s/ENE/</g' "$location"/icons.wun
elif test "$a" = "Eas"
then sed -i '5s/Eas/=/g' "$location"/icons.wun
elif test "$a" = "ESE"
then sed -i '5s/ESE/>/g' "$location"/icons.wun
elif test "$a" = "SE "
then sed -i '5s/SE /?/g' "$location"/icons.wun
elif test "$a" = "SSE"
then sed -i '5s/SSE/@/g' "$location"/icons.wun
else sed -i '5s/$/-/' "$location"/icons.wun
fi;
a=`sed -n '24p' "$location"/messages.wun|cut -c1-3 `
if test "$a" = "Sou"
then sed -i '6s/Sou/1/g' "$location"/icons.wun
elif test "$a" = "SSW"
then sed -i '6s/SSW/2/g' "$location"/icons.wun
elif test "$a" = "SW "
then sed -i '6s/SW /3/g' "$location"/icons.wun
elif test "$a" = "WSW"
then sed -i '6s/WSW/4/g' "$location"/icons.wun
elif test "$a" = "Wes"
then sed -i '6s/Wes/5/g' "$location"/icons.wun
elif test "$a" = "WNW"
then sed -i '6s/WNW/6/g' "$location"/icons.wun
elif test "$a" = "NW "
then sed -i '6s/NW /7/g' "$location"/icons.wun
elif test "$a" = "NNW"
then sed -i '6s/NNW/8/g' "$location"/icons.wun
elif test "$a" = "Nor"
then sed -i '6s/Nor/9/g' "$location"/icons.wun
elif test "$a" = "NNE"
then sed -i '6s/NNE/:/g' "$location"/icons.wun
elif test "$a" = "NE "
then sed -i '6s/NE /;/g' "$location"/icons.wun
elif test "$a" = "ENE"
then sed -i '6s/ENE/</g' "$location"/icons.wun
elif test "$a" = "Eas"
then sed -i '6s/Eas/=/g' "$location"/icons.wun
elif test "$a" = "ESE"
then sed -i '6s/ESE/>/g' "$location"/icons.wun
elif test "$a" = "SE "
then sed -i '6s/SE /?/g' "$location"/icons.wun
elif test "$a" = "SSE"
then sed -i '6s/SSE/@/g' "$location"/icons.wun
else sed -i '6s/$/-/' "$location"/icons.wun
fi;
a=`sed -n '28p' "$location"/messages.wun|cut -c1-3 `
if test "$a" = "Sou"
then sed -i '7s/Sou/1/g' "$location"/icons.wun
elif test "$a" = "SSW"
then sed -i '7s/SSW/2/g' "$location"/icons.wun
elif test "$a" = "SW "
then sed -i '7s/SW /3/g' "$location"/icons.wun
elif test "$a" = "WSW"
then sed -i '7s/WSW/4/g' "$location"/icons.wun
elif test "$a" = "Wes"
then sed -i '7s/Wes/5/g' "$location"/icons.wun
elif test "$a" = "WNW"
then sed -i '7s/WNW/6/g' "$location"/icons.wun
elif test "$a" = "NW "
then sed -i '7s/NW /7/g' "$location"/icons.wun
elif test "$a" = "NNW"
then sed -i '7s/NNW/8/g' "$location"/icons.wun
elif test "$a" = "Nor"
then sed -i '7s/Nor/9/g' "$location"/icons.wun
elif test "$a" = "NNE"
then sed -i '7s/NNE/:/g' "$location"/icons.wun
elif test "$a" = "NE "
then sed -i '7s/NE /;/g' "$location"/icons.wun
elif test "$a" = "ENE"
then sed -i '7s/ENE/</g' "$location"/icons.wun
elif test "$a" = "Eas"
then sed -i '7s/Eas/=/g' "$location"/icons.wun
elif test "$a" = "ESE"
then sed -i '7s/ESE/>/g' "$location"/icons.wun
elif test "$a" = "SE "
then sed -i '7s/SE /?/g' "$location"/icons.wun
elif test "$a" = "SSE"
then sed -i '7s/SSE/@/g' "$location"/icons.wun
else sed -i '7s/$/-/' "$location"/icons.wun
fi;
a=`sed -n '32p' "$location"/messages.wun|cut -c1-3 `
if test "$a" = "Sou"
then sed -i '8s/Sou/1/g' "$location"/icons.wun
elif test "$a" = "SSW"
then sed -i '8s/SSW/2/g' "$location"/icons.wun
elif test "$a" = "SW "
then sed -i '8s/SW /3/g' "$location"/icons.wun
elif test "$a" = "WSW"
then sed -i '8s/WSW/4/g' "$location"/icons.wun
elif test "$a" = "Wes"
then sed -i '8s/Wes/5/g' "$location"/icons.wun
elif test "$a" = "WNW"
then sed -i '8s/WNW/6/g' "$location"/icons.wun
elif test "$a" = "NW "
then sed -i '8s/NW /7/g' "$location"/icons.wun
elif test "$a" = "NNW"
then sed -i '8s/NNW/8/g' "$location"/icons.wun
elif test "$a" = "Nor"
then sed -i '8s/Nor/9/g' "$location"/icons.wun
elif test "$a" = "NNE"
then sed -i '8s/NNE/:/g' "$location"/icons.wun
elif test "$a" = "NE "
then sed -i '8s/NE /;/g' "$location"/icons.wun
elif test "$a" = "ENE"
then sed -i '8s/ENE/</g' "$location"/icons.wun
elif test "$a" = "Eas"
then sed -i '8s/Eas/=/g' "$location"/icons.wun
elif test "$a" = "ESE"
then sed -i '8s/ESE/>/g' "$location"/icons.wun
elif test "$a" = "SE "
then sed -i '8s/SE /?/g' "$location"/icons.wun
elif test "$a" = "SSE"
then sed -i '8s/SSE/@/g' "$location"/icons.wun
else sed -i '8s/$/-/' "$location"/icons.wun
fi;
a=`sed -n '36p' "$location"/messages.wun|cut -c1-3 `
if test "$a" = "Sou"
then sed -i '9s/Sou/1/g' "$location"/icons.wun
elif test "$a" = "SSW"
then sed -i '9s/SSW/2/g' "$location"/icons.wun
elif test "$a" = "SW "
then sed -i '9s/SW /3/g' "$location"/icons.wun
elif test "$a" = "WSW"
then sed -i '9s/WSW/4/g' "$location"/icons.wun
elif test "$a" = "Wes"
then sed -i '9s/Wes/5/g' "$location"/icons.wun
elif test "$a" = "WNW"
then sed -i '9s/WNW/6/g' "$location"/icons.wun
elif test "$a" = "NW "
then sed -i '9s/NW /7/g' "$location"/icons.wun
elif test "$a" = "NNW"
then sed -i '9s/NNW/8/g' "$location"/icons.wun
elif test "$a" = "Nor"
then sed -i '9s/Nor/9/g' "$location"/icons.wun
elif test "$a" = "NNE"
then sed -i '9s/NNE/:/g' "$location"/icons.wun
elif test "$a" = "NE "
then sed -i '9s/NE /;/g' "$location"/icons.wun
elif test "$a" = "ENE"
then sed -i '9s/ENE/</g' "$location"/icons.wun
elif test "$a" = "Eas"
then sed -i '9s/Eas/=/g' "$location"/icons.wun
elif test "$a" = "ESE"
then sed -i '9s/ESE/>/g' "$location"/icons.wun
elif test "$a" = "SE "
then sed -i '9s/SE /?/g' "$location"/icons.wun
elif test "$a" = "SSE"
then sed -i '9s/SSE/@/g' "$location"/icons.wun
else sed -i '9s/$/-/' "$location"/icons.wun
fi;
a=`sed -n '40p' "$location"/messages.wun|cut -c1-3 `
if test "$a" = "Sou"
then sed -i '10s/Sou/1/g' "$location"/icons.wun
elif test "$a" = "SSW"
then sed -i '10s/SSW/2/g' "$location"/icons.wun
elif test "$a" = "SW "
then sed -i '10s/SW /3/g' "$location"/icons.wun
elif test "$a" = "WSW"
then sed -i '10s/WSW/4/g' "$location"/icons.wun
elif test "$a" = "Wes"
then sed -i '10s/Wes/5/g' "$location"/icons.wun
elif test "$a" = "WNW"
then sed -i '10s/WNW/6/g' "$location"/icons.wun
elif test "$a" = "NW "
then sed -i '10s/NW /7/g' "$location"/icons.wun
elif test "$a" = "NNW"
then sed -i '10s/NNW/8/g' "$location"/icons.wun
elif test "$a" = "Nor"
then sed -i '10s/Nor/9/g' "$location"/icons.wun
elif test "$a" = "NNE"
then sed -i '10s/NNE/:/g' "$location"/icons.wun
elif test "$a" = "NE "
then sed -i '10s/NE /;/g' "$location"/icons.wun
elif test "$a" = "ENE"
then sed -i '10s/ENE/</g' "$location"/icons.wun
elif test "$a" = "Eas"
then sed -i '10s/Eas/=/g' "$location"/icons.wun
elif test "$a" = "ESE"
then sed -i '10s/ESE/>/g' "$location"/icons.wun
elif test "$a" = "SE "
then sed -i '10s/SE /?/g' "$location"/icons.wun
elif test "$a" = "SSE"
then sed -i '10s/SSE/@/g' "$location"/icons.wun
else sed -i '10s/$/-/' "$location"/icons.wun
fi;
a=`sed -n '44p' "$location"/messages.wun|cut -c1-3 `
if test "$a" = "Sou"
then sed -i '11s/Sou/1/g' "$location"/icons.wun
elif test "$a" = "SSW"
then sed -i '11s/SSW/2/g' "$location"/icons.wun
elif test "$a" = "SW "
then sed -i '11s/SW /3/g' "$location"/icons.wun
elif test "$a" = "WSW"
then sed -i '11s/WSW/4/g' "$location"/icons.wun
elif test "$a" = "Wes"
then sed -i '11s/Wes/5/g' "$location"/icons.wun
elif test "$a" = "WNW"
then sed -i '11s/WNW/6/g' "$location"/icons.wun
elif test "$a" = "NW "
then sed -i '11s/NW /7/g' "$location"/icons.wun
elif test "$a" = "NNW"
then sed -i '11s/NNW/8/g' "$location"/icons.wun
elif test "$a" = "Nor"
then sed -i '11s/Nor/9/g' "$location"/icons.wun
elif test "$a" = "NNE"
then sed -i '11s/NNE/:/g' "$location"/icons.wun
elif test "$a" = "NE "
then sed -i '11s/NE /;/g' "$location"/icons.wun
elif test "$a" = "ENE"
then sed -i '11s/ENE/</g' "$location"/icons.wun
elif test "$a" = "Eas"
then sed -i '11s/Eas/=/g' "$location"/icons.wun
elif test "$a" = "ESE"
then sed -i '11s/ESE/>/g' "$location"/icons.wun
elif test "$a" = "SE "
then sed -i '11s/SE /?/g' "$location"/icons.wun
elif test "$a" = "SSE"
then sed -i '11s/SSE/@/g' "$location"/icons.wun
else sed -i '11s/$/-/' "$location"/icons.wun
fi;
a=`sed -n '48p' "$location"/messages.wun|cut -c1-3 `
if test "$a" = "Sou"
then sed -i '12s/Sou/1/g' "$location"/icons.wun
elif test "$a" = "SSW"
then sed -i '12s/SSW/2/g' "$location"/icons.wun
elif test "$a" = "SW "
then sed -i '12s/SW /3/g' "$location"/icons.wun
elif test "$a" = "WSW"
then sed -i '12s/WSW/4/g' "$location"/icons.wun
elif test "$a" = "Wes"
then sed -i '12s/Wes/5/g' "$location"/icons.wun
elif test "$a" = "WNW"
then sed -i '12s/WNW/6/g' "$location"/icons.wun
elif test "$a" = "NW "
then sed -i '12s/NW /7/g' "$location"/icons.wun
elif test "$a" = "NNW"
then sed -i '12s/NNW/8/g' "$location"/icons.wun
elif test "$a" = "Nor"
then sed -i '12s/Nor/9/g' "$location"/icons.wun
elif test "$a" = "NNE"
then sed -i '12s/NNE/:/g' "$location"/icons.wun
elif test "$a" = "NE "
then sed -i '12s/NE /;/g' "$location"/icons.wun
elif test "$a" = "ENE"
then sed -i '12s/ENE/</g' "$location"/icons.wun
elif test "$a" = "Eas"
then sed -i '12s/Eas/=/g' "$location"/icons.wun
elif test "$a" = "ESE"
then sed -i '12s/ESE/>/g' "$location"/icons.wun
elif test "$a" = "SE "
then sed -i '12s/SE /?/g' "$location"/icons.wun
elif test "$a" = "SSE"
then sed -i '12s/SSE/@/g' "$location"/icons.wun
else sed -i '12s/$/-/' "$location"/icons.wun
fi;
a=`sed -n '52p' "$location"/messages.wun|cut -c1-3 `
if test "$a" = "Sou"
then sed -i '13s/Sou/1/g' "$location"/icons.wun
elif test "$a" = "SSW"
then sed -i '13s/SSW/2/g' "$location"/icons.wun
elif test "$a" = "SW "
then sed -i '13s/SW /3/g' "$location"/icons.wun
elif test "$a" = "WSW"
then sed -i '13s/WSW/4/g' "$location"/icons.wun
elif test "$a" = "Wes"
then sed -i '13s/Wes/5/g' "$location"/icons.wun
elif test "$a" = "WNW"
then sed -i '13s/WNW/6/g' "$location"/icons.wun
elif test "$a" = "NW "
then sed -i '13s/NW /7/g' "$location"/icons.wun
elif test "$a" = "NNW"
then sed -i '13s/NNW/8/g' "$location"/icons.wun
elif test "$a" = "Nor"
then sed -i '13s/Nor/9/g' "$location"/icons.wun
elif test "$a" = "NNE"
then sed -i '13s/NNE/:/g' "$location"/icons.wun
elif test "$a" = "NE "
then sed -i '13s/NE /;/g' "$location"/icons.wun
elif test "$a" = "ENE"
then sed -i '13s/ENE/</g' "$location"/icons.wun
elif test "$a" = "Eas"
then sed -i '13s/Eas/=/g' "$location"/icons.wun
elif test "$a" = "ESE"
then sed -i '13s/ESE/>/g' "$location"/icons.wun
elif test "$a" = "SE "
then sed -i '13s/SE /?/g' "$location"/icons.wun
elif test "$a" = "SSE"
then sed -i '13s/SSE/@/g' "$location"/icons.wun
else sed -i '13s/$/-/' "$location"/icons.wun
fi;
a=`sed -n '56p' "$location"/messages.wun|cut -c1-3 `
if test "$a" = "Sou"
then sed -i '14s/Sou/1/g' "$location"/icons.wun
elif test "$a" = "SSW"
then sed -i '14s/SSW/2/g' "$location"/icons.wun
elif test "$a" = "SW "
then sed -i '14s/SW /3/g' "$location"/icons.wun
elif test "$a" = "WSW"
then sed -i '14s/WSW/4/g' "$location"/icons.wun
elif test "$a" = "Wes"
then sed -i '14s/Wes/5/g' "$location"/icons.wun
elif test "$a" = "WNW"
then sed -i '14s/WNW/6/g' "$location"/icons.wun
elif test "$a" = "NW "
then sed -i '14s/NW /7/g' "$location"/icons.wun
elif test "$a" = "NNW"
then sed -i '14s/NNW/8/g' "$location"/icons.wun
elif test "$a" = "Nor"
then sed -i '14s/Nor/9/g' "$location"/icons.wun
elif test "$a" = "NNE"
then sed -i '14s/NNE/:/g' "$location"/icons.wun
elif test "$a" = "NE "
then sed -i '14s/NE /;/g' "$location"/icons.wun
elif test "$a" = "ENE"
then sed -i '14s/ENE/</g' "$location"/icons.wun
elif test "$a" = "Eas"
then sed -i '14s/Eas/=/g' "$location"/icons.wun
elif test "$a" = "ESE"
then sed -i '14s/ESE/>/g' "$location"/icons.wun
elif test "$a" = "SE "
then sed -i '14s/SE /?/g' "$location"/icons.wun
elif test "$a" = "SSE"
then sed -i '14s/SSE/@/g' "$location"/icons.wun
else sed -i '14s/$/-/' "$location"/icons.wun
fi;
