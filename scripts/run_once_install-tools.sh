#!/bin/sh
set -e

if ! command -v brew >/dev/null 2>&1; then
  echo "brew not installed yet"
  exit 1
fi

echo "Installing Brew packages..."
brew bundle --file="$HOME/.local/share/chezmoi/Brewfile"
