#!/bin/bash

# This script is intended to work with the native screenshot app that comes with gnome on xorg
# Please note that in newer versions of GNOME the screenshot util is baked in and isn't an external
# app so you'll need to install an older one via pacman

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
# -c copies to clipboard
# -a specify area
# as a note, you cannot use -d with -a

if [ "$1" == "area" ]; then
	gnome-screenshot -a -c -f "$FILENAME"
elif [ "$1" == "full" ]; then
	gnome-screenshot -c -f "$FILENAME"
else
	echo "Invalid argument. Use "area" or "full"."
fi
