.DEFAULT_GOAL := explain

.PHONY: explain
explain:
	@echo dotfiles
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage: \033[36m\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

.PHONY: git
git: ## Setup git
	@echo "Setting up git"
	@chmod +x ./scripts/setup.sh
	@./scripts/setup.sh -g

.PHONY: brew
brewMac: ## [macOS] Install brew
	@echo "Installing brew"
	@chmod +x ./scripts/setupMac.sh
	@./scripts/setupMac.sh -b

.PHONY: install
installMac: ## [macOS] Install dependencies
	@echo "Installing all dependencies"
	@chmod +x ./scripts/setupMac.sh
	@./scripts/setupMac.sh -i

.PHONY: dotfiles
dotfilesMac: ## [macOS] Set dotfiles
	@echo "Setting dotfiles"
	@chmod +x ./scripts/setupMac.sh
	@./scripts/setupMac.sh -d
