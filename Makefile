CURDIR=`pwd`
LOCAL_ZSHRC_FILE=$(CURDIR)/.zshrc
HOME_ZSHRC_FILE=$(HOME)/.zshrc
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
	cp $(LOCAL_ALIASES_FILE) $(HOME_ALIASES_FILE)
	cp $(LOCAL_ZSHRC_FILE) $(HOME_ZSHRC_FILE)

develop:
	ln -sf $(LOCAL_ALIASES_FILE) $(HOME_ALIASES_FILE)
	ln -sf $(LOCAL_ZSHRC_FILE) $(HOME_ZSHRC_FILE)
