# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="gallois"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# TODO: look into zsh-autosuggestions, zsh-syntax-highlighting
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# Set prompt. Based on gallois theme, but with host info.
PROMPT=$'%{$fg[blue]%}<%n@%B%m%b%{$fg[blue]%}> %{$fg[green]%}[%~% ]%(?.%{$fg[yellow]%}.%{$fg[red]%}) %B$%b '

export VISUAL="vim"

# Vim navigation in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Command line editing
autoload -U edit-command-line && zle -N edit-command-line

# Function to move things from downloads with correct autocomplete 
mvdl() { mv $HOME/downloads/$1 $2; }
_mvdl() { _arguments '1: :_files -W $HOME/downloads' '2: :_files'; }
compdef _mvdl mvdl

# Use vim style line editing in zsh
bindkey -v
# Movement
bindkey -a 'gg' beginning-of-buffer-or-history
bindkey -a 'G' end-of-buffer-or-history
# Undo
bindkey -a 'u' undo
bindkey -a '^R' redo
# Edit line
bindkey -a '^V' edit-command-line
# Backspace
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char

# Use incremental search
bindkey "^R" history-incremental-search-backward

# Disable shell builtins
disable r

source ~/.shell/functions.sh
source ~/.shell/bootstrap.sh
source ~/.shell/aliases.sh

# Allow local customizations in the ~/.zshrc_local file
if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi
