#!/bin/bash

#Weatherstack Api Used
API_KEY=$API_KEY #set your api key as environment variable or API_KEY="Your api key"
City=$1
Format=$2
API_URL="http://api.weatherstack.com/current?access_key=${API_KEY}&query=${City}"
WEATHER_DATA=$(curl -s "$API_URL")

if [ ! $City ]; then
    echo "City is missing: use '-h' or 'help' to see how to use the script"
    exit 1
fi

if [[ $1 == "-h" || $1 == "help" ]]; then
    echo "  -Write the city name to check the temperature"
    echo "      Example usage: './weather_checker.sh Istanbul'"
    echo ""
    echo ""
    echo "  -If the city name has 2 seperate words, use '%20' in between"
    echo "      Example: './weather_checker Los%20Angeles'"
    echo ""
    echo ""
    echo "  -Default format is Celcius.If you want to see the tempereture in Fahrenheit. Write 'f' after the City name"
    echo "      Example: './weather_checker New%20York f'"
    exit 1
fi

CITY_NAME=$(echo "$WEATHER_DATA" | jq -r '.location' | jq -r '.name')
TEMPERATURE=$(echo "$WEATHER_DATA" | jq -r '.current' | jq -r '.temperature')

if [[ $Format == "f" ]]; then
    TEMPERATURE=$(($TEMPERATURE * 9/5 + 32))
fi

echo "City Name: $CITY_NAME"
echo "TEMPERATURE: $TEMPERATURE"