install:
	install -Dm755 ./bin/rename-mp3-files $(HOME)/.local/bin/rename-mp3-files

uninstall:
	rm -f $(HOME)/.local/bin/rename-mp3-files