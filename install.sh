#!/bin/bash

# Define the location where we want to install the script (User's bin directory)
USER_BIN="$HOME/bin"

# Check if the bin directory exists; if not, create it
if [ ! -d "$USER_BIN" ]; then
  echo "Creating bin directory in home directory: $USER_BIN"
  mkdir "$USER_BIN"
fi

# Define the installation path for the script
INSTALL_PATH="$USER_BIN/noob"

# Check if the script is already installed
if [ -f "$INSTALL_PATH" ]; then
  echo "Affirmations are already installed. You can run 'noob' anytime."
  exit 0
fi

# Download the noob script directly from GitHub
echo "Downloading noob script..."

# URL to raw script from GitHub (replace with your actual raw URL)
RAW_URL="https://raw.githubusercontent.com/1nam/noob/refs/heads/main/noob.sh"

# Use curl to download the file and make it executable
curl -s -o "$INSTALL_PATH" "$RAW_URL"
chmod +x "$INSTALL_PATH"

# Add the bin directory to the user's PATH if it's not already there
if ! echo "$PATH" | grep -q "$USER_BIN"; then
  echo "Adding $USER_BIN to PATH"
  echo "export PATH=\"$USER_BIN:\$PATH\"" >> "$HOME/.bashrc"
  echo "Please restart your terminal or run 'source ~/.bashrc' to apply the changes."
fi

# Confirm successful installation
if [ -f "$INSTALL_PATH" ]; then
  echo "noob installed successfully! You can now run 'noob' to receive a daily example."
else
  echo "Something went wrong during the installation. Please try again."
  exit 1
fi
