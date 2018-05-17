.PHONY: all
all: test install

.PHONY: test
test: shellcheck

.PHONY: shellcheck
shellcheck:
	@shellcheck bashrc.d/*

.PHONY: install
install:
	@./install macos

.PHONY: gitignore
gitignore:
	@rm config/git/ignore
	@gibo Eclipse JetBrains macOS Vim VisualStudioCode >> config/git/ignore
