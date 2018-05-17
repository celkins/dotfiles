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
