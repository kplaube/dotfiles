#!/bin/bash

# Alacritty
# ---------
echo ">> Installing Alacritty..."
brew install --cask alacritty

echo ">> Configuring Alacritty..."
mv $HOME/.config/alacritty $HOME/.config/alacritty.bak
ln -s $PWD/alacritty/ $HOME/.config/alacritty

echo ">> Done"
echo ""

# itermocil
# ---------
if [ ! -f $HOME/.itermocil ]; then
  echo ">> Overwriting itermocil configuration..."
  ln -s $PWD/itermocil $HOME/.itermocil
fi

# tmux
# ----
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

# Node
# ----
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

mv $ZED_SETTINGS_FOLDER/{settings,tasks}.json /tmp/

ln -s $PWD/zed/settings.json $ZED_SETTINGS_FOLDER/settings.json
ln -s $PWD/zed/tasks.json $ZED_SETTINGS_FOLDER/tasks.json

echo ">> Done"
echo ""

# zsh
# ---
echo ">> Installing oh-my-zsh..."
if [ ! -d $HOME/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "oh-my-zsh already installed."
fi

echo ">> Overwriting zshrc..."
mv $HOME/.zshrc $HOME/.zshrc.bak
ln -s $PWD/zshrc $HOME/.zshrc

echo ">> Setting up custom aliases..."
ln -s $PWD/my-aliases.sh $HOME/.my-aliases.sh

if [ ! -f $PWD/my-aliases.private.sh ]; then
  ln -s $PWD/my-aliases.private.sh $HOME/.my-aliases.private.sh
fi

echo ">> Done"
echo ""