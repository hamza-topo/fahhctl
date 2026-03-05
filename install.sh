#!/usr/bin/env bash
set -e

REPO="https://raw.githubusercontent.com/hamza-topo/fahhctl/main"

BIN_DIR="$HOME/.local/bin"
DATA_DIR="$HOME/.local/share/fahh"

mkdir -p "$BIN_DIR"
mkdir -p "$DATA_DIR"

echo "Installing fahhctl..."

curl -fsSL "$REPO/bin/fahhctl" -o "$BIN_DIR/fahhctl"
chmod +x "$BIN_DIR/fahhctl"

echo "Installing sound..."

curl -fsSL "$REPO/sounds/fahh.mp3" -o "$DATA_DIR/fahh.mp3"

echo "Installation complete ✅"
echo ""
echo "Run:"
echo "source ~/.zshrc"
echo ""
echo "Then test with:"
echo "fakecommand"