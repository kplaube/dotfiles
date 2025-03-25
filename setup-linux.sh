#!/bin/bash

# tmux
# ----
echo ">> Installing tmux..."

sudo apt install tmux

if [ ! -f $HOME/.tmux/plugins/tpm ]; then
  echo ">> Installing tmux plugin manager..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

if [ -f $HOME/.tmux.conf ]; then
  echo ">> Overwriting tmux configuration..."
  mv $HOME/.tmux.conf $HOME/.tmux.conf.bak
fi

ln -s $PWD/tmux.conf $HOME/.tmux.conf

echo ">> Done"
echo ""

# fish
# ----
echo ">> Installing fish shell..."
sudo apt install fish

echo ">> Done"
echo ""

# Alacritty
# ---------
echo ">> Installing Alacritty..."
sudo apt install alacritty

echo ">> Configuring Alacritty..."
mv $HOME/.config/alacritty $HOME/.config/alacritty.bak
ln -sf $PWD/alacritty $HOME/.config/alacritty

echo ">> Done"
echo ""

# Zed
# ---
ZED_SETTINGS_FOLDER=$HOME/.config/zed

echo ">> Installing Zed and custom settings..."
brew install --cask zed

ln -sf $PWD/zed/settings.json $ZED_SETTINGS_FOLDER/settings.json
ln -sf $PWD/zed/tasks.json $ZED_SETTINGS_FOLDER/tasks.json

echo ">> Done"
echo ""
