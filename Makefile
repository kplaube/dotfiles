CURDIR=`pwd`
LOCAL_ZSH_PROFILE=$(CURDIR)/.zshrc
HOME_ZSH_PROFILE=$(HOME)/.zshrc
LOCAL_ZPREZTORC=$(CURDIR)/.zpreztorc
HOME_ZPREZTORC=$(HOME)/.zpreztorc
LOCAL_ALIASES_FILE=$(CURDIR)/.my-aliases.sh
HOME_ALIASES_FILE=$(HOME)/.my-aliases.sh

help:
	@echo "Let me help you with these awesome tasks"
	@echo ""
	@echo "Usage:"
	@echo "    make install            install .bash_profile and .zshrc"
	@echo "    make develop            make a symbolic link of .bash_profile and .zshrc to your $HOME"
	@echo ""

install:
	cp $(LOCAL_ZSH_PROFILE) $(HOME_ZSH_PROFILE)
	cp $(LOCAL_ZPREZTORC) $(HOME_ZPREZTORC)
	cp $(LOCAL_ALIASES_FILE) $(HOME_ALIASES_FILE)

develop:
	ln -sf $(LOCAL_ZSH_PROFILE) $(HOME_ZSH_PROFILE)
	ln -sf $(LOCAL_ZPREZTORC) $(HOME_ZPREZTORC)
	ln -sf $(LOCAL_ALIASES_FILE) $(HOME_ALIASES_FILE)
