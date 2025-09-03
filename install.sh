#!/bin/bash

# install.sh: Install Kitty configuration from repo

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
KITTY_SOURCE_DIR="$SCRIPT_DIR/kitty"
KITTY_CONFIG_DIR="$HOME/.config/kitty"

echo "Installing Kitty config from $KITTY_SOURCE_DIR -> $KITTY_CONFIG_DIR"

# Create config directory if it doesn't exist
mkdir -p "$(dirname "$KITTY_CONFIG_DIR")"

# Backup existing config if it exists
if [[ -d "$KITTY_CONFIG_DIR" ]]; then
    BACKUP_DIR="$KITTY_CONFIG_DIR.backup.$(date +%Y%m%d_%H%M%S)"
    echo "Backing up existing config to $BACKUP_DIR"
    mv "$KITTY_CONFIG_DIR" "$BACKUP_DIR"
fi

# Copy config from repo
cp -r "$KITTY_SOURCE_DIR" "$KITTY_CONFIG_DIR"

echo "✓ Kitty config installed successfully!"