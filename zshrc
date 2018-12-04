# Vim as default editor of course
export EDITOR='vim'
#
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

# Path to rbenv installation
export RBENV_ROOT=/usr/local/var/rbenv

# Load rbenv
eval "$(rbenv init -)"

if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi

source $ZSH/oh-my-zsh.sh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration
SAVEHIST=1000
HISTFILE=~/.zsh_history

export PATH=$PATH:$HOME/bin:/usr/local/bin
export LC_ALL=en_US.utf-8 
export LANG="$LC_ALL"
export TERM=xterm-256color
export LC_TIME=en_US.utf-8 

# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# export openssl directories
export OPENSSL_INCLUDE_DIR="/usr/local/opt/openssl/include"
export OPENSSL_LIB_DIR="/usr/local/optopenssl/lib"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

# Load minimalist prompt
export PROMPT="$HOME/dotfiles/prompt.zsh"
source $PROMPT

source /Users/jhuang/.aliases
