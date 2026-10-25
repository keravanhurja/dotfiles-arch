#!/usr/bin/env bash

set -euo pipefail

DOTFILES="$HOME/dotfiles"

echo "Installing packages..."
sudo pacman -S --needed --noconfirm \
	git stow \
	i3-wm xorg-server xorg-xinit \
	polybar rofi feh dunst \
	xterm ttf-dejavu \
	neovim tmux

echo "Creating configuration directories..."
mkdir -p "$HOME/.config"

echo "Installing dotfiles..."
cd "$DOTFILES"

stow -t "$HOME" \
	i3 \
	polybar \
	rofi \
	xresources \
	xinit

echo "Done!"
echo "Start i3 using: startx"
