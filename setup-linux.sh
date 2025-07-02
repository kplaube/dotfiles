#!/bin/bash

# Warm up
#--------
sudo apt update
sudo apt install build-essential snapd -y

# tmux
# ----
echo ">> Installing tmux..."
echo "---------------------"

sudo apt install tmux -y

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
echo "---------------------------"

sudo apt install fish -y

echo ">> Setting up custom aliases..."
ln -sf $PWD/my-aliases.fish $HOME/.my-aliases.fish

if [ ! -f $PWD/my-aliases.private.fish ]; then
  ln -sf $PWD/my-aliases.private.fish $HOME/.my-aliases.private.fish
fi

echo ">> Setting up custom fish configuration..."
if [ -f $HOME/.config/fish/config.fish ]; then
  mv $HOME/.config/fish/config.fish $HOME/.config/fish/config.fish.bak
fi

ln -s $PWD/config.fish $HOME/.config/fish/config.fish

echo ">> Installing Fisher..."
if command -v fish >/dev/null 2>&1; then
  fish -c 'curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source; and fisher install jorgebucaran/fisher'
fi

echo ">> Done"
echo ""

# Alacritty
# ---------
echo ">> Installing Alacritty..."
echo "--------------------------"

sudo apt install alacritty

echo ">> Configuring Alacritty..."

if [ -d $HOME/.config/alacritty ]; then
  rm -rf $HOME/.config/alacritty.bak
  mv $HOME/.config/alacritty $HOME/.config/alacritty.bak
fi

ln -s $PWD/alacritty $HOME/.config/alacritty

echo ">> Done"
echo ""

# Pyenv
# -----
echo ">> Installing Pyenv..."
echo "---------------------"

if [ ! -d $HOME/.pyenv ]; then
  curl -fsSL https://pyenv.run | bash
else
  echo "Pyenv already installed."
fi

echo ">> Done"
echo ""

# NeoVim + LazyVim
# ----------------
echo ">> Installing NeoVim + LazyVim..."
echo "---------------------------------"

sudo snap install nvim --classic

NVIM_PATH=$HOME/.config/nvim

if [ -d $NVIM_PATH/lua/config ]; then
  mv $NVIM_PATH/lua/config $NVIM_PATH/lua/config.bak
fi
if [ -d $NVIM_PATH/lua/plugins ]; then
  mv $NVIM_PATH/lua/plugins $NVIM_PATH/lua/plugins.bak
fi

echo ">> Installing LazyVim..."
if [ ! -d $NVIM_PATH ]; then
  git clone https://github.com/LazyVim/starter ~/.config/nvim
  rm -rf $NVIM_PATH/.git
else
  echo "LazyVim already installed."
fi

echo ">> Overwriting NeoVim configuration..."
ln -s $PWD/nvim/config $NVIM_PATH/lua/config
ln -s $PWD/nvim/plugins $NVIM_PATH/lua/plugins

echo ">> Done"
echo ""

# Node.js + NVM
# -------------
fish -c 'fisher install jorgebucaran/nvm.fish'
fish -c 'nvm install lts && nvm alias default lts'
