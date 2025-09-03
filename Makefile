PREFIX = /usr
MANDIR = $(PREFIX)/share/man
BASHDIR = $(PREFIX)/share/bash-completion/completions
FISHDIR = $(PREFIX)/share/fish/vendor_completions.d

.PHONY: default install

default: aur.1 shell-completions/aur-completion.bash

shell-completions/aur-completion.bash:
	cd shell-completions && bash-completor -c aur.completor.bash

aur.1:
	help2man -n "A simple script for AUR package management" -N ./aur -o aur.1 

install: shell-completions/aur-completion.bash aur.1
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	@mkdir -p $(DESTDIR)$(MANDIR)/man1
	@mkdir -p $(DESTDIR)$(BASHDIR)
	@mkdir -p $(DESTDIR)$(FISHDIR)
	cp -p aur $(DESTDIR)$(PREFIX)/bin/aur
	cp -p aur.1 $(DESTDIR)$(MANDIR)/man1
	cp -p shell-completions/aur-completion.bash $(DESTDIR)$(BASHDIR)/aur
	cp -p shell-completions/aur.fish $(DESTDIR)$(FISHDIR)/aur.fish
	chmod 755 $(DESTDIR)$(PREFIX)/bin/aur
