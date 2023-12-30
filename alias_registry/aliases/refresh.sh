#!/bin/bash

# Directory containing the scripts
ALIASES_DIR=~/aliases

# Apply execute permissions to all files and directories within ALIASES_DIR
find "$ALIASES_DIR" -type f -exec chmod +x {} \;

# Runs source on the alias_registry.sh in order to make new aliases available in current shell session
source ~/.bashrc
echo "Applied x perms to all files and sourced ~/.bashrc"
