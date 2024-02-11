.DEFAULT_GOAL := explain

.PHONY: explain
explain:
	@echo dotfiles
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage: \033[36m\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

.PHONY: brew
brew: ## Install brew
	@echo "Installing brew"
	@chmod +x ./scripts/setup.sh
	@./scripts/setup.sh -b

.PHONY: git
git: ## Setup git
	@echo "Setting up git"
	@chmod +x ./scripts/setup.sh
	@./scripts/setup.sh -g

.PHONY: install
install: ## Install all dependencies
	@echo "Installing all dependencies"
	@chmod +x ./scripts/setup.sh
	@./scripts/setup.sh -i

.PHONY: dotfiles
setDotfiles: ## Set dotfiles
	@echo "Setting dotfiles"
	@chmod +x ./scripts/setup.sh
	@./scripts/setup.sh -d
