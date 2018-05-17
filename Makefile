.PHONY: test
test: shellcheck

.PHONY: shellcheck
shellcheck:
	@shellcheck bashrc.d/*
