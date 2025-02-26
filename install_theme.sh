#!/bin/bash

GHOSTTY_THEME_DIR="$HOME/.config/ghostty/themes"

mkdir -p "$GHOSTTY_THEME_DIR"

THEME_FILES=$(find themes -type f -name "*.conf")

if [ -z "$THEME_FILES" ]; then
    echo "No theme files found in the themes/ directory."
    exit 1
fi

echo "Installing themes..."
for file in $THEME_FILES; do
    THEME_NAME=$(basename "$file")
    cp "$file" "$GHOSTTY_THEME_DIR/"
    echo "✔ Installed: $THEME_NAME"
done

echo -e "\n All themes installed successfully!"
echo "📂 Installed themes in $GHOSTTY_THEME_DIR/:"

ls -1 "$GHOSTTY_THEME_DIR/"