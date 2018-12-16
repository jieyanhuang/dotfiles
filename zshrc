# Vim as default editor of course
export EDITOR='vim'

bindkey -e

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

# Load rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi

# User configuration
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Appends every command to the history file once it is executed
setopt inc_append_history
# Reloads the history whenever you use it
setopt share_history

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

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

fpath=(/usr/local/share/zsh-completions $fpath)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
