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

# bash
# ----
echo ">> Installing bash goodies..."
echo "---------------------------"

echo ">> Setting up custom aliases..."
ln -sf $PWD/bash_aliases $HOME/.bash_aliases

if [ ! -f $HOME/.bash_aliases.private ]; then
  ln -sf $PWD/.bash_aliases.private $HOME/.bash_aliases.private
fi

echo ">> Setting up .profile..."
mv $HOME/.profile $HOME/.profile.bak
ln -s $PWD/profile $HOME/.profile

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
