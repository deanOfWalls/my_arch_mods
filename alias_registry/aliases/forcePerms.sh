#!/bin/bash

# Directory containing the scripts
ALIASES_DIR=~/aliases

# Apply execute permissions to all files and directories within ALIASES_DIR
find "$ALIASES_DIR" -type f -exec chmod +x {} \;
echo -e "\e[38;5;205mPermissions updated. Please source ~/.bashrc\e[0m"
