#!/bin/bash

#Weatherstack Api Used
API_KEY=$API_KEY #set your api key as environment variable or API_KEY="Your api key"
City=$1
Format=$2
API_URL="http://api.weatherstack.com/current?access_key=${API_KEY}&query=${City}"
WEATHER_DATA=$(curl -s "$API_URL")

if [ ! $City ]; then
    echo "City is missing: Ex. ./weather_checker.sh Istanbul"
    exit 1
fi

CITY_NAME=$(echo "$WEATHER_DATA" | jq -r '.location' | jq -r '.name')
TEMPERATURE=$(echo "$WEATHER_DATA" | jq -r '.current' | jq -r '.temperature')

if [[ $Format == "f" ]]; then
    TEMPERATURE=$(($TEMPERATURE * 9/5 + 32))
fi

echo "City Name: $CITY_NAME"
echo "TEMPERATURE: $TEMPERATURE"