#! /bin/sh

city="Hanoi" # Your city here
city_cryptic=$(echo $city | sed -e 's/ /_/g')

format="$(curl wttr.in/$city_cryptic?format='%c%t' --silent)"

if [ "$(echo $format | grep 'Unknown')" = "" ];
then 
  #echo "$condition$text_condition | $temperature"
  echo "摒    Hanoi$format" | sed -e 's/  / /g'
else
  echo "摒0°C"
fi
