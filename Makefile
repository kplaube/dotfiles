CURDIR=`pwd`
OS_NAME=$(shell uname -s | tr A-Z a-z)

ALIASES_LOCAL_FILE=$(CURDIR)/.my-aliases.sh
ALIASES_HOME_FILE=$(HOME)/.my-aliases.sh
VIM_LOCAL_FILE=$(CURDIR)/.vimrc
VIM_HOME_FILE=$(HOME)/.vimrc
ZSHRC_LOCAL_FILE=$(CURDIR)/.zshrc
ZSHRC_HOME_FILE=$(HOME)/.zshrc

help:
	@echo "Let me help you with these awesome tasks"
	@echo "You are using a $(OS_NAME)."
	@echo ""
	@echo "Usage:"
	@echo "    make clean              removes everything related to this project from your home"
	@echo "    make install            create symlinks for zshrc, aliases and vim files"
	@echo ""

clean:
	rm $(ZSHRC_HOME_FILE)
	rm $(ALIASES_HOME_FILE)

install: _setup_aliases _setup_vim _setup_zsh _setup_ohmyzsh
	@echo "\nDone! :D"

_setup_aliases:
	@echo "\nSetting up aliases..."
	ln -sf $(ALIASES_LOCAL_FILE) $(ALIASES_HOME_FILE)

_setup_vim:
	@echo "\nInstaling vim..."
ifeq ($(OS_NAME), linux)
	sudo apt install vim
else
	brew install view
endif
	@echo "\nSetting up Vim..."
	curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	ln -sf $(VIM_LOCAL_FILE) $(VIM_HOME_FILE)

_setup_zsh:
	@echo "\nInstalling zsh..."
ifeq ($(OS_NAME), linux)
	sudo apt install zsh
else
	brew install zsh
endif
	@echo "\nSetting up zsh..."
	ln -sf $(ZSHRC_LOCAL_FILE) $(ZSHRC_HOME_FILE)

_setup_ohmyzsh:
	@echo "\nInstalling oh-my-zsh..."
	curl -fsSLo /tmp/install.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
	sh /tmp/install.sh
