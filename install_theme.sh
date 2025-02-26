#!/bin/bash

GHOSTTY_THEME_DIR="$HOME/.config/ghostty/themes"

mkdir -p "$GHOSTTY_THEME_DIR"

THEME_FILES=$(find themes -type f -name "*.conf")

if [ -z "$THEME_FILES" ]; then
    echo "No theme files found in the themes/ directory."
    exit 1
fi

echo "Installing themes..."
INSTALLED_THEMES=()

for file in $THEME_FILES; do
    THEME_NAME=$(basename "$file")
    cp "$file" "$GHOSTTY_THEME_DIR/"
    INSTALLED_THEMES+=("$THEME_NAME")
    echo "✔ Installed: $THEME_NAME"
done

if [ ${#INSTALLED_THEMES[@]} -gt 0 ]; then
    echo -e "\n✅ Installed themes:"
    for theme in "${INSTALLED_THEMES[@]}"; do
        echo "📂 $theme"
    done
else
    echo -e "\nNo new themes were installed."
fi

echo -e "\n All themes installed successfully!"