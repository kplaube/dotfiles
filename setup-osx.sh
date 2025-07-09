#!/bin/bash

# tmux
# ----
echo ">> Installing tmux..."
echo "---------------------"

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

echo "Installing tmuxinator..."
brew install tmuxinator

if [ ! -d $HOME/.tmuxinator ]; then
  mkdir -p $HOME/.tmuxinator
fi

for f in "$HOME"/.tmuxinator/*; do
  if [ -f "$f" ]; then
    mv "$f" "$f.bk"
  fi
done

if [ -d $PWD/tmuxinator.private ]; then
  for f in $PWD/tmuxinator.private/*; do
    echo "Found tmuxinator template file: $f"
    if [ -f "$f" ]; then
      ln -s "$PWD/tmuxinator.private/$(basename "$f")" "$HOME/.tmuxinator/$(basename "$f")"
    fi
  done
fi

echo ">> Done"
echo ""

# fish
# ----
echo ">> Installing fish shell..."
echo "---------------------------"

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

brew install --cask alacritty

echo ">> Configuring Alacritty..."

if [ -d $HOME/.config/alacritty ]; then
  rm -f $HOME/.config/alacritty.bak
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
echo ">> Installing Neovim..."
echo "-----------------------"

brew install neovim

NVIM_PATH=$HOME/.config/nvim

echo ">> Installing LazyVim..."
if [ ! -d $NVIM_PATH ]; then
  git clone https://github.com/LazyVim/starter ~/.config/nvim
  rm -rf $NVIM_PATH/.git
else
  echo "LazyVim already installed."
fi

NVIM_CONFIG_PATH=$NVIM_PATH/lua/config
NVIM_PLUGINS_PATH=$NVIM_PATH/lua/plugins

if [ -f $NVIM_CONFIG_PATH ] || [ -L $NVIM_CONFIG_PATH ]; then
  rm -rf $NVIM_PATH/lua/config.bak
  mv $NVIM_CONFIG_PATH $NVIM_PATH/lua/config.bak
fi
if [ -f $NVIM_PLUGINS_PATH ] || [ -L $NVIM_PLUGINS_PATH ]; then
  rm -rf $NVIM_PATH/lua/plugins.bak
  mv $NVIM_PLUGINS_PATH $NVIM_PATH/lua/plugins.bak
fi

echo ">> Overwriting NeoVim configuration..."
ln -s $PWD/nvim/config $NVIM_PATH/lua/config
ln -s $PWD/nvim/plugins $NVIM_PATH/lua/plugins

echo ">> Done"
echo ""

# Node.js + NVM
# -------------
fish -c 'fisher install jorgebucaran/nvm.fish'
fish -c "nvm install 'lts/*'"
