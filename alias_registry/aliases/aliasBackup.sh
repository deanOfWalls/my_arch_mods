#!/bin/bash

# Define the source paths
ALIAS_REGISTRY=~/alias_registry.sh
ALIASES_DIR=~/aliases

# Define the backup directory
BACKUP_DIR=/home/dean/Dev/my_arch_mods/alias_registry

# Create the backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Copy the alias registry file and the aliases directory
cp "$ALIAS_REGISTRY" "$BACKUP_DIR/"
cp -r "$ALIASES_DIR" "$BACKUP_DIR/"

echo -e "\e[38;5;205mAlias Registry has been backed up to ${BACKUP_DIR}!\e[0m"

