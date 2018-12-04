# Vim as default editor of course
export EDITOR='vim'

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

# Path to rbenv installation
export RBENV_ROOT=/usr/local/var/rbenv

# Load rbenv
eval "$(rbenv init -)"

if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi

# Base16 Shell
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

export PATH=$PATH:$HOME/bin:/usr/local/bin
export LC_ALL=en_US.utf-8
export LANG="$LC_ALL"
export TERM=xterm-256color
export LC_TIME=en_US.utf-8

# Set locale to utf8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# export openssl directories
export OPENSSL_INCLUDE_DIR=`brew --prefix openssl`/include
export OPENSSL_LIB_DIR=`brew --prefix openssl`/lib

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
