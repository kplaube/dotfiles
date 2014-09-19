CURDIR=`pwd`
LOCAL_BASH_PROFILE=$(CURDIR)/.bash_profile
HOME_BASH_PROFILE=$(HOME)/.bash_profile

help:
	@echo "Let me help you with these awesome tasks"
	@echo ""
	@echo "Usage:"
	@echo "    make install            install .bash_profile"
	@echo "    make develop            make a symbolic link of .bash_profile to your $HOME"
	@echo ""

install:
	cp $(LOCAL_BASH_PROFILE) $(HOME_BASH_PROFILE)

develop:
	ln -sf $(LOCAL_BASH_PROFILE) $(HOME_BASH_PROFILE)
