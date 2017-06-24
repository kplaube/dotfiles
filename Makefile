CURDIR=`pwd`
ZSHRC_LOCAL_FILE=$(CURDIR)/.zshrc
ZSHRC_HOME_FILE=$(HOME)/.zshrc
ALIASES_LOCAL_FILE=$(CURDIR)/.my-aliases.sh
ALIASES_HOME_FILE=$(HOME)/.my-aliases.sh
EMACS_LOCAL_FILE=$(CURDIR)/init.el
EMACS_HOME_FILE=$(HOME)/.emacs.d
EMACS_HOME_INIT_FILE=$(EMACS_HOME_FILE)/init.el
TMUXCONF_LOCAL_FILE=$(CURDIR)/.tmux.conf
TMUXCONF_HOME_FILE=$(HOME)/.tmux.conf
TMUXP_LOCAL_FOLDER=$(CURDIR)/.tmuxp
TMUXP_HOME_FOLDER=$(HOME)/.tmuxp

help:
	@echo "Let me help you with these awesome tasks"
	@echo ""
	@echo "Usage:"
	@echo "    make install            install .bash_profile and .zshrc"
	@echo "    make develop            make a symbolic link of .bash_profile and .zshrc to your $HOME"
	@echo ""

install: _create_emacs_dir
	cp $(ALIASES_LOCAL_FILE) $(ALIASES_HOME_FILE)
	cp $(ZSHRC_LOCAL_FILE) $(ZSHRC_HOME_FILE)
	cp $(EMACS_LOCAL_FILE) $(EMACS_HOME_INIT_FILE)
	cp $(TMUXCONF_LOCAL_FILE) $(TMUXCONF_HOME_FILE)
	cp -r $(TMUXP_LOCAL_FOLDER) $(TMUXP_HOME_FOLDER)

develop: _create_emacs_dir
	ln -sf $(ALIASES_LOCAL_FILE) $(ALIASES_HOME_FILE)
	ln -sf $(ZSHRC_LOCAL_FILE) $(ZSHRC_HOME_FILE)
	ln -sf $(EMACS_LOCAL_FILE) $(EMACS_HOME_INIT_FILE)
	ln -sf $(TMUXCONF_LOCAL_FILE) $(TMUXCONF_HOME_FILE)
	ln -sf $(TMUXP_LOCAL_FOLDER) $(TMUXP_HOME_FOLDER)

_create_emacs_dir:
	mkdir -p $(EMACS_HOME_FILE)
