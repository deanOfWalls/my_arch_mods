#!/bin/bash

# Directory to save screenshots in
SCREENSHOT_DIR=~/Pictures/Screenshots

# Make sure the screenshot directory exists
mkdir -p "$SCREENSHOT_DIR"

# Filename based on current date and time [year/month/day/hour/minute/second]
FILENAME="$SCREENSHOT_DIR/screenshot-$(date +%Y%m%d%H%M%S).png"
TEMP_FILENAME="$SCREENSHOT_DIR/temp-screenshot-$(date +%Y%m%d%H%M%S).png"

# Function to get the display geometry for the display containing the cursor
get_display_geometry() {
    # Get the cursor position
    CURSOR_POS=$(xdotool getmouselocation --shell)
    X_POS=$(echo "$CURSOR_POS" | grep 'X=' | cut -d'=' -f2)
    Y_POS=$(echo "$CURSOR_POS" | grep 'Y=' | cut -d'=' -f2)

    # Check if X_POS and Y_POS are numbers
    if ! [[ "$X_POS" =~ ^[0-9]+$ ]] || ! [[ "$Y_POS" =~ ^[0-9]+$ ]]; then
        echo "Error: Invalid cursor position."
        exit 1
    fi

    # Get the geometry of all connected displays
    DISPLAYS=$(xrandr | grep ' connected' | grep -oP '\d+x\d+\+\d+\+\d+')

    for DISP in $DISPLAYS; do
        # Parse geometry
        DISP_WIDTH=$(echo $DISP | cut -d'x' -f1)
        DISP_HEIGHT=$(echo $DISP | cut -d'x' -f2 | cut -d'+' -f1)
        DISP_X=$(echo $DISP | cut -d'+' -f2)
        DISP_Y=$(echo $DISP | cut -d'+' -f3)

        # Check if cursor is within this display
        if [ "$X_POS" -ge "$DISP_X" ] && [ "$X_POS" -lt $(($DISP_X + $DISP_WIDTH)) ] && [ "$Y_POS" -ge "$DISP_Y" ] && [ "$Y_POS" -lt $(($DISP_Y + $DISP_HEIGHT)) ]; then
            echo "${DISP_WIDTH}x${DISP_HEIGHT}+${DISP_X}+${DISP_Y}"
            return
        fi
    done
    echo "Error: Display containing cursor not found."
    exit 1
}

# Check for the screenshot mode (area select/whole screen) in the first argument ($1)
if [ "$1" == "area" ]; then
    scrot -s "$FILENAME" # -s allows you to select an area
    cat "$FILENAME" | xclip -selection clipboard -t image/png
elif [ "$1" == "full" ]; then
    GEOMETRY=$(get_display_geometry)
    if [[ $GEOMETRY != "Error: Display containing cursor not found." ]]; then
        scrot "$TEMP_FILENAME" # Capture the full screen first
        convert "$TEMP_FILENAME" -crop "$GEOMETRY" "$FILENAME" # Crop to the active display
        rm "$TEMP_FILENAME" # Remove the temporary full screenshot
        cat "$FILENAME" | xclip -selection clipboard -t image/png
    else
        echo "$GEOMETRY"
    fi
else
    echo "Invalid argument. Use 'area' or 'full'."
fi