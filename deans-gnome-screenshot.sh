#!/bin/bash

# This script is intended to work with the native screenshot app that comes with gnome on xorg

# Directory to save screenshots in
SCREENSHOT_DIR=~/Pictures/Screenshots

# Make sure the screenshot directory exists
mkdir -p "$SCREENSHOT_DIR"

# Filename based on current date an time [year/month/day/hour/second]
FILENAME="$SCREENSHOT_DIR/screenshot-$(date +%Y%m%d%H%M%S).png"

# Check for the screenshot mode (area select/whole screen)  in the first argument ($1)
# -p includes mouse pointer
# -w limits the region to the active window
# -d add a time delay (in seconds). this is useful for capturing drop down menus, etc.
# -f specify path and filename
# -a specify area
# as a note, you cannot use -d with -a

if [ "$1" == "area" ]; then
	gnome-screenshot -a -f "$FILENAME"
elif [ "$1" == "full" ]; then
	gnome-screenshot -f "$FILENAME"
else
	echo "Invalid argument. Use "area" or "full"."
fi
