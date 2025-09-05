#!/bin/bash

# Install location for the script
INSTALL_DIR="$HOME/bin"

# Check if ~/bin exists, if not create it
if [ ! -d "$INSTALL_DIR" ]; then
  echo "Creating ~/bin directory..."
  mkdir -p "$INSTALL_DIR"
fi

# Clone the repository into the user's home directory (noob repo)
echo "Cloning the Noob repository..."
git clone https://github.com/1nam/noob.git "$HOME/noob"

# Copy the noob script to ~/bin
echo "Installing Noob script..."
cp "$HOME/noob/noob" "$INSTALL_DIR/noob"

# Make sure the script is executable
chmod +x "$INSTALL_DIR/noob"

# Add ~/bin to PATH if it's not already in ~/.bashrc
if ! grep -q "$INSTALL_DIR" "$HOME/.bashrc"; then
  echo "export PATH=\"$HOME/bin:\$PATH\"" >> "$HOME/.bashrc"
  echo "Added ~/bin to PATH in ~/.bashrc"
fi

# Reload the .bashrc to apply the changes
source "$HOME/.bashrc"

# Final message
echo "Noob has been successfully installed!"
echo "You can now use the command 'noob' from anywhere in the terminal."
