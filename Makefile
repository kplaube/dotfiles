CURDIR=`pwd`

ALIASES_LOCAL_FILE=$(CURDIR)/.my-aliases.sh
ALIASES_HOME_FILE=$(HOME)/.my-aliases.sh
ITERMOCIL_LOCAL_FOLDER=$(CURDIR)/.itermocil
ITERMOCIL_HOME_FOLDER=$(HOME)/.itermocil
ITERMOCIL_LOCAL_TRADESHIFT_FOLDER=$(ITERMOCIL_LOCAL_FOLDER)/tradeshift
VSCODE_LOCAL_FILE=$(CURDIR)/settings.json
VSCODE_HOME_FILE=$(HOME)/Library/Application\ Support/Code/User/settings.json
ZSHRC_LOCAL_FILE=$(CURDIR)/.zshrc
ZSHRC_HOME_FILE=$(HOME)/.zshrc

help:
	@echo "Let me help you with these awesome tasks"
	@echo ""
	@echo "Usage:"
	@echo "    make clean              removes everything related to this project from your home
	@echo "    make install            install zshrc, aliases and vim files
	@echo ""

clean:
	rm $(ZSHRC_HOME_FILE)
	rm $(ALIASES_HOME_FILE)

install: _setup_alises _setup_itermocil _setup_vscode _setup_zsh
	@echo "\nDone! :D"

_setup_alises:
	@echo "\nSetting up aliases..."
	ln -sf $(ALIASES_LOCAL_FILE) $(ALIASES_HOME_FILE)

_setup_itermocil:
	@echo "\nSetting up iTermocil..."
	mkdir -p $(ITERMOCIL_HOME_FOLDER)
	ln -sf $(ITERMOCIL_LOCAL_TRADESHIFT_FOLDER)/*.yml $(ITERMOCIL_HOME_FOLDER)/

_setup_vscode:
	@echo "\nSetting up VS Code..."
	ln -sf $(VSCODE_LOCAL_FILE) $(VSCODE_HOME_FILE)

_setup_zsh:
	@echo "\nSetting up zsh..."
	ln -sf $(ZSHRC_LOCAL_FILE) $(ZSHRC_HOME_FILE)