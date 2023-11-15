#!/bin/bash

# This script generates a thumbnail for an SVG file with a specified bg color
# This is to avoid the default behavior of displaying a checkerboard pattern for transparency

# Specifically, when you browse files in a file manager (like Nautilus in GNOME), the system
# generates thumbnails to help you visually id the files without opening them.
# These thumbnails are usually stored in a hidden directory in your home folder.
# For GNOME this is typically '~/.cache/thumbnails'.
# GNOME offers this functionality by default but doesn't meet my desired outcome when it comes to
# the background color of the thumbnails.


# Input and output file paths from arguments

# The first arugment is the input SVG file
infile="$1"

# The second argument is the output file path for the thumbnail
outfile"$2"

# Attempt to steal (retrieve) the primary background color from GNOME settings
bgcolor=$(gsettings get org.gnome.desktop.background primary-color)

# Background color for the thumbnail.
# This is set to black (#000000) by default.

if [ -z "$bgcolor" ]; then
	bgcolor="#000000"
fi

# Remove quotes from the color value (if present)
bgcolor=${bgcolor//\'/}

rsvg-convert "$infile" -b "$bgcolor" -o "$outfile"
