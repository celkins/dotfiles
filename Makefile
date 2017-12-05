SHELLCHECK ?= shellcheck

.PHONY: check shellcheck

check: shellcheck

shellcheck:
	@find . -maxdepth 3 -type f -not -path './.git*' -not -path './dotbot/*' | xargs file | egrep 'shell|bash' | awk '{ print $$1 }' | sed 's/://g' | xargs $(SHELLCHECK) -s bash
