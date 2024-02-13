#!/bin/bash

# Define colors
color_start_red="\033[38;5;196m"
color_start_pink="\033[38;5;205m"
color_start_blue="\033[38;5;33m"
color_end="\033[0m"

# Function to search YouTube and present top 12 results
search_and_present_results() {
    query="$*"
    echo -e "${color_start_red}Searching YouTube for: $query...${color_end}"
    search_results=$(yt-dlp "ytsearch12:$query" --get-title --get-id --skip-download --quiet 2>/dev/null)

    # Check if search results are empty or contain error message
    if [ -z "$search_results" ]; then
        echo "No results found for '$query' or there was an error."
        exit 1
    fi

    # Display search results titles and store video IDs
    index=1
    while IFS= read -r title; do
        read -r id
        if [ "$index" -le 12 ]; then
            echo -e "${color_start_blue}$index.${color_end} ${color_start_pink}$title${color_end}"
            titles[$index]="$title"
            ids[$index]="$id"
        fi
        ((index++))
    done <<< "$search_results"
}

# Function to play the chosen song in the background
play_song() {
    video_id="${ids[$1]}"
    if [ -z "$video_id" ]; then
        echo "Invalid selection."
        exit 1
    fi
    mpv "https://www.youtube.com/watch?v=$video_id" --no-video &
    MPV_PID=$!
}

# Function to stop playing the song
stop_song() {
    kill $MPV_PID
}

# Main script
if [ -z "$1" ]; then
    echo "Usage: $0 <search_query>"
    exit 1
fi

search_and_present_results "$@"

echo "To stop the song, run 'stop' command."
echo "To pause the song, run 'pause' command."

while :
do
    read -p "> " selection
    case "$selection" in
        stop)
            stop_song
            exit
            ;;
        pause)
            kill -STOP $MPV_PID
            ;;
        resume)
            kill -CONT $MPV_PID
            ;;
        [1-9]|10|11|12)
            play_song "$selection"
            ;;
        *)
            echo "Invalid selection."
            ;;
    esac
done
