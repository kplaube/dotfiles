CURDIR=`pwd`
LOCAL_ZSHRC_FILE=$(CURDIR)/.zshrc
HOME_ZSHRC_FILE=$(HOME)/.zshrc
LOCAL_ALIASES_FILE=$(CURDIR)/.my-aliases.sh
HOME_ALIASES_FILE=$(HOME)/.my-aliases.sh
LOCAL_EMACS_INIT_FILE=$(CURDIR)/init.el
HOME_EMACS_DIR=$(HOME)/.emacs.d
HOME_EMACS_INIT_FILE=$(HOME_EMACS_DIR)/init.el

help:
	@echo "Let me help you with these awesome tasks"
	@echo ""
	@echo "Usage:"
	@echo "    make install            install .bash_profile and .zshrc"
	@echo "    make develop            make a symbolic link of .bash_profile and .zshrc to your $HOME"
	@echo ""

install: _create_emacs_dir
	cp $(LOCAL_ALIASES_FILE) $(HOME_ALIASES_FILE)
	cp $(LOCAL_ZSHRC_FILE) $(HOME_ZSHRC_FILE)
	cp $(LOCAL_EMACS_INIT_FILE) $(HOME_EMACS_INIT_FILE)

develop: _create_emacs_dir
	ln -sf $(LOCAL_ALIASES_FILE) $(HOME_ALIASES_FILE)
	ln -sf $(LOCAL_ZSHRC_FILE) $(HOME_ZSHRC_FILE)
	ln -sf $(LOCAL_EMACS_INIT_FILE) $(HOME_EMACS_INIT_FILE)

_create_emacs_dir:
	mkdir -p $(HOME_EMACS_DIR)
