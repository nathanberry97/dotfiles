# Path to your oh-my-zsh installation.
export ZSH="/Users/nathan/.oh-my-zsh"

# Path to PSQL
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/13/bin

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/

plugins=(
	git
)

source $ZSH/oh-my-zsh.sh

# Aliases
alias repos="/Users/nathan/Documents/projects"
alias dotfiles="/Users/nathan/Documents/projects/dotfiles"
alias todo="/Users/nathan/Documents/projects/todo"
alias retro="/Users/nathan/Documents/projects/RetroGames"
alias website="/Users/nathan/Documents/projects/nathanberry97.github.io"

alias py="python3"
alias gh="history | grep"
alias ls="ls -l"

alias branch="git checkout -b"
alias checkout="git checkout"
alias add="git add -A"
alias commit="git commit -m"
alias push="git push"

# command prompt theme
eval "$(starship init zsh)"
