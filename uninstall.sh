#!/usr/bin/env bash
set -euo pipefail

BIN="$HOME/.local/bin/fahhctl"
DATA="$HOME/.local/share/fahh"

echo "Disabling shell hooks..."
if command -v fahhctl >/dev/null 2>&1; then
    fahhctl disable
fi

echo "Removing files..."
rm -f "$BIN"
rm -rf "$DATA"

echo ""
echo "🗑 fahhctl removed"
echo ""

read -r -p "Reload shell now? [Y/n]: " answer
answer="${answer:-Y}"

case "$answer" in
  [Yy]* )
    echo "Reloading shell..."
    exec "${SHELL:-/bin/sh}"
    ;;
  * )
    echo "Run: source ~/.zshrc"
    ;;
esac