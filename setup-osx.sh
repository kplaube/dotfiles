#!/bin/bash

# tmux
# ----
echo ">> Installing tmux..."

brew install tmux

if [ ! -f $HOME/.tmux/plugins/tpm ]; then
  echo ">> Installing tmux plugin manager..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

if [ -f $HOME/.tmux.conf ]; then
  echo ">> Overwriting tmux configuration..."
  mv $HOME/.tmux.conf $HOME/.tmux.conf.bak
fi

ln -s $PWD/tmux.conf $HOME/.tmux.conf

# fish
# ----
echo ">> Installing fish shell..."
brew install fish
sudo ln -s /opt/homebrew/bin/fish /usr/local/bin/fish

echo ">> Setting up custom aliases..."
ln -s $PWD/my-aliases.fish $HOME/.my-aliases.fish

if [ ! -f $PWD/my-aliases.private.fish ]; then
    ln -s $PWD/my-aliases.private.fish $HOME/.my-aliases.private.fish
fi

echo ">> Setting up custom fish configuration..."

if [ -f $HOME/.config/fish/config.fish ]; then
  mv $HOME/.config/fish/config.fish $HOME/.config/fish/config.fish.bak
fi

ln -s $PWD/config.fish $HOME/.config/fish/config.fish

echo ">> Done"
echo ""

# Alacritty
# ---------
echo ">> Installing Alacritty..."
brew install --cask alacritty

echo ">> Configuring Alacritty..."

if [ -d $HOME/.config/alacritty ]; then
  rm -f $HOME/.config/alacritty.bak
  mv $HOME/.config/alacritty $HOME/.config/alacritty.bak
fi

ln -s $PWD/alacritty $HOME/.config/alacritty

echo ">> Done"
echo ""

# NodeJS
# ------
NODE_VERSION=20
NVM_EXEC=$HOME/.nvm/nvm.sh

echo ">> Installing NVM + Node..."
if [ ! -d $HOME/.nvm ]; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
else
  echo "NVM already installed."
fi

$NVM_EXEC install $NODE_VERSION
$NVM_EXEC use default

node -v

echo ">> Done"
echo ""

# NeoVim + LazyVim
# ----------------
NVIM_PATH=$HOME/.config/nvim

echo ">> Installing NeoVim + LazyVim..."
if [ ! -d $NVIM_PATH ]; then
  git clone https://github.com/LazyVim/starter ~/.config/nvim
  rm -rf $NVIM_PATH/.git

  echo ">> Overwriting NeoVim configuration..."
  mv $NVIM_PATH/lua/config $NVIM_PATH/lua/config.bak
  ln -s $PWD/nvim/lua/config $NVIM_PATH/lua/config
  mv $NVIM_PATH/lua/plugins $NVIM_PATH/lua/plugins.bak
  ln -s $PWD/nvim/lua/plugins $NVIM_PATH/lua/plugins
else
  echo "NeoVim + LazyVim already installed."
fi

echo ">> Done"
echo ""

# Zed
# ---
ZED_SETTINGS_FOLDER=$HOME/.config/zed

echo ">> Installing Zed and custom settings..."
brew install --cask zed

mv -f $ZED_SETTINGS_FOLDER/{settings,tasks}.json /tmp/

ln -s $PWD/zed/settings.json $ZED_SETTINGS_FOLDER/settings.json
ln -s $PWD/zed/tasks.json $ZED_SETTINGS_FOLDER/tasks.json

echo ">> Done"
echo ""
