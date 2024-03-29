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

.PHONY: installLinux
installLinux: ## [Linux] Install dependencies
	@echo "Installing all dependencies"
	@chmod +x ./scripts/setupLinux.sh
	@./scripts/setupLinux.sh -i

.PHONY: dotfilesLinux
dotfilesLinux: ## [Linux] Set dotfiles
	@echo "Setting dotfiles"
	@chmod +x ./scripts/setupLinux.sh
	@./scripts/setupLinux.sh -d

.PHONY: brew
brewMac: ## [macOS] Install brew
	@echo "Installing brew"
	@chmod +x ./scripts/setupMac.sh
	@./scripts/setupMac.sh -b

.PHONY: installMac
installMac: ## [macOS] Install dependencies
	@echo "Installing all dependencies"
	@chmod +x ./scripts/setupMac.sh
	@./scripts/setupMac.sh -i

.PHONY: dotfilesMac
dotfilesMac: ## [macOS] Set dotfiles
	@echo "Setting dotfiles"
	@chmod +x ./scripts/setupMac.sh
	@./scripts/setupMac.sh -d
