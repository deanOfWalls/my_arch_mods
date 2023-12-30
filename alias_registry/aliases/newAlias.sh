#!/bin/bash

# Check if two arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: newAlias <aliasCommandName> <aliasShellScriptName>"
    exit 1
fi

ALIAS_NAME=$1
SCRIPT_NAME=$2.sh
ALIAS_DIR=~/aliases
ALIAS_REGISTRY=~/alias_registry.sh

# Check if the alias already exists in alias_registry.sh
if grep -q "^alias $ALIAS_NAME=" "$ALIAS_REGISTRY"; then
    echo "Alias '$ALIAS_NAME' already exists."
    exit 1
fi

# Check if the script file already exists
if [ -f "$ALIAS_DIR/$SCRIPT_NAME" ]; then
    echo "Shell script '$SCRIPT_NAME' already exists in $ALIAS_DIR."
    exit 1
fi

# Create the new script file
echo "#!/bin/bash" > "$ALIAS_DIR/$SCRIPT_NAME"
chmod +x "$ALIAS_DIR/$SCRIPT_NAME"

# Add the alias to alias_registry.sh
echo "alias $ALIAS_NAME='$ALIAS_DIR/$SCRIPT_NAME \$@'" >> "$ALIAS_REGISTRY"

echo "Alias $ALIAS_NAME created successfully."
