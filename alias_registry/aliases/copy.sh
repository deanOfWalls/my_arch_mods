#!/bin/bash

# Check if a filename is provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# Check if the file exists
if [ ! -f "$1" ]; then
    echo "Error: File '$1' not found."
    exit 1
fi

# Copy the contents of the file to the clipboard using xclip
cat "$1" | xclip -selection primary

echo "Contents of '$1' copied to the clipboard."
