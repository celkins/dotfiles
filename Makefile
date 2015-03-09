DOTFILES := $(shell pwd)

all: shell git

shell:
	ln -fs $(DOTFILES)/bash_login ${HOME}/.bash_login
	ln -fs $(DOTFILES)/bash_logout ${HOME}/.bash_logout
	ln -fs $(DOTFILES)/bash_profile ${HOME}/.bash_profile
	ln -fs $(DOTFILES)/bashrc ${HOME}/.bashrc
	ln -fs $(DOTFILES)/inputrc ${HOME}/.inputrc
	ln -fs $(DOTFILES)/profile ${HOME}/.profile
	ln -fs $(DOTFILES)/vimrc ${HOME}/.vimrc

git:
	ln -fs $(DOTFILES)/gitignore ${HOME}/.gitignore
