
BIN ?= savegit
PREFIX ?= /usr/local

install:
	cp savegit.sh $(PREFIX)/bin/$(BIN)
	chmod +x $(PREFIX)/bin/$(BIN)

uninstall:
	rm -f $(PREFIX)/bin/$(BIN)
	
