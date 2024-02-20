#!/bin/bash

# API Key for OpenWeatherMap
API_KEY="f5ab3ad3f280f68fce430560c038f753"

# Latitude and Longitude for the location (Middletown, Delaware)
LAT="39.4496"
LON="-75.7163"

# Make API call to OpenWeatherMap
weather_data=$(curl -s "https://api.openweathermap.org/data/3.0/onecall?lat=$LAT&lon=$LON&exclude=minutely&appid=$API_KEY")

# Extract current temperature and feels like temperature
current_temp_kelvin=$(echo "$weather_data" | jq -r '.current.temp')
current_temp_celsius=$(echo "scale=2; $current_temp_kelvin - 273.15" | bc)
current_temp_fahrenheit=$(echo "scale=2; $current_temp_celsius * 9/5 + 32" | bc)

feels_like_kelvin=$(echo "$weather_data" | jq -r '.current.feels_like')
feels_like_celsius=$(echo "scale=2; $feels_like_kelvin - 273.15" | bc)
feels_like_fahrenheit=$(echo "scale=2; $feels_like_celsius * 9/5 + 32" | bc)

# Extract current weather condition
weather_desc=$(echo "$weather_data" | jq -r '.current.weather[0].description')

# Print current date and time
printf "\033[1;36m$(date +'%H:%M %d, %B, %Y')\033[0m\n"

# Print current weather condition
case $weather_desc in
    "clear sky") weather_desc="Clear ☀";;
    "few clouds") weather_desc="Partly Cloudy ⛅";;
    "scattered clouds") weather_desc="Partly Cloudy ⛅";;
    "broken clouds") weather_desc="Partly Cloudy ⛅";;
    "overcast clouds") weather_desc="Cloudy ☁";;
    "light rain") weather_desc="Light Rain 🌧";;
    "moderate rain") weather_desc="Rain 🌧";;
    "heavy intensity rain") weather_desc="Heavy Rain 🌧";;
    "light snow") weather_desc="Light Snow ❄";;
    "snow") weather_desc="Snow ❄";;
    "mist") weather_desc="Mist 🌫";;
    *) weather_desc="Unknown Weather Condition";;
esac

printf "\033[38;2;255;215;0mCurrent Condition:\033[0m \033[38;2;255;215;0m$weather_desc\033[0m\n"

# Color code temperature based on range
if (( $(echo "$current_temp_fahrenheit <= 32" | bc -l) )); then
    temp_color="\033[38;2;0;255;255m" # Aqua (below freezing)
elif (( $(echo "$current_temp_fahrenheit > 32" | bc -l) && $(echo "$current_temp_fahrenheit < 86" | bc -l) )); then
    temp_color="\033[38;2;255;165;0m" # Orange (between freezing and 86°F)
else
    temp_color="\033[38;2;255;105;180m" # Pink (above 86°F)
fi

printf "${temp_color}Current Temperature: $current_temp_celsius°C / $current_temp_fahrenheit°F\033[0m\n"
printf "${temp_color}Feels Like: $feels_like_celsius°C / $feels_like_fahrenheit°F\033[0m\n"
