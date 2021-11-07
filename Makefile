XDG_CONFIG_HOME ?= $(HOME)/.config


.PHONY: install
install: ## Sets up symlinks for vim and neovim
	ln -snf "$(HOME)/.vim/vimrc" "$(HOME)/.vimrc"
	mkdir -p "$(XDG_CONFIG_HOME)"
	ln -snf "$(HOME)/.vim" "$(XDG_CONFIG_HOME)/nvim"
	ln -snf "$(HOME)/.vimrc" "$(XDG_CONFIG_HOME)/nvim/init.vim"

.PHONY: install-plugins
install-plugins: ## Install all plugins
	nvim -es -u vimrc -i NONE -c "PlugInstall" -c "qa"

.PHONY: update-plugins
update-plugins: ## Updates all plugins
	nvim -es -u vimrc -i NONE -c "PlugUpdate" -c "qa"

.PHONY: clean-plugins
clean-plugins: ## Remove unlisted plugins
	nvim -es -u vimrc -i NONE -c "PlugClean" -c "qa"

.PHONY: upgrade-vim-plug
upgrade-vim-plug: ## Upgrade vim-plug itself
	nvim -es -u vimrc -i NONE -c "PlugUpgrade" -c "qa"

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
