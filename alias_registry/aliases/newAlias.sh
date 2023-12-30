# Check if one argument is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: newAlias <aliasCommandName>"
    exit 1
fi

ALIAS_NAME=$1
SCRIPT_NAME=$1.sh
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

echo -e "\e[38;5;205mAlias $ALIAS_NAME created succesfully!\e[0m"
