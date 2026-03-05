#!/usr/bin/env bash
set -euo pipefail

OWNER="hamza-topo"
REPO="fahhctl"
BRANCH="main"

RAW="https://raw.githubusercontent.com/${OWNER}/${REPO}/${BRANCH}"

BIN_DIR="$HOME/.local/bin"
DATA_DIR="$HOME/.local/share/fahh"

FAHHCTL_PATH="$BIN_DIR/fahhctl"
SOUND_PATH="$DATA_DIR/fahh.mp3"

echo "Installing fahhctl..."
mkdir -p "$BIN_DIR" "$DATA_DIR"

# Download binary
curl -fsSL "${RAW}/bin/fahhctl" -o "$FAHHCTL_PATH"
chmod +x "$FAHHCTL_PATH"

# Download bundled sound
echo "Installing sound..."
curl -fsSL "${RAW}/sounds/fahh.mp3" -o "$SOUND_PATH"

# Enable hooks (zsh + bash)
echo "Enabling shell hooks..."
"$FAHHCTL_PATH" enable

echo ""
echo "✅ Installation complete"
echo "Binary: $FAHHCTL_PATH"
echo "Sound:  $SOUND_PATH"
echo ""

# Ask to reload shell now
read -r -p "Reload shell now? [Y/n]: " answer
answer="${answer:-Y}"

case "$answer" in
  [Yy]* )
    echo "Reloading shell..."
    # exec replaces the current shell process, making .zshrc/.bashrc load
    exec "${SHELL:-/bin/sh}"
    ;;
  * )
    echo "Ok. To activate in this terminal run:"
    echo "  source ~/.zshrc   # if you use zsh"
    echo "  source ~/.bashrc  # if you use bash"
    echo ""
    echo "Test: type a wrong command like: fakecommand"
    ;;
esac

# Ask to reload shell (must read from terminal, not from the pipe)
if [ -t 1 ] && [ -r /dev/tty ]; then
  echo ""
  printf "Reload shell now to activate hooks? [Y/n]: " > /dev/tty
  read -r answer < /dev/tty || answer="Y"
  answer="${answer:-Y}"

  case "$answer" in
    [Yy]* )
      echo "Reloading shell..." > /dev/tty
      exec "${SHELL:-/bin/sh}"
      ;;
    * )
      echo "Ok. Run: source ~/.zshrc (or open a new terminal)" > /dev/tty
      ;;
  esac
else
  echo "Open a new terminal or run: source ~/.zshrc"
fi