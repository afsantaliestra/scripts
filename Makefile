.DEFAULT_GOAL := zsh

bash:
	@echo "Appending aliases and functions to .bashrc file"
	@echo "source ~/scripts/terminal_sources/aliases" >> ~/.bashrc
	@echo "source ~/scripts/terminal_sources/functions" >> ~/.bashrc

zsh:
	@echo "Appending aliases and functions to .zshrc file"
	@echo "source ~/scripts/terminal_sources/aliases" >> ~/.zshrc
	@echo "source ~/scripts/terminal_sources/functions" >> ~/.zshrc
