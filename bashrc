# Vim as default editor of course
export EDITOR='vim'

export PATH=$PATH:$HOME/bin:/usr/local/bin
export LC_ALL=en_US.utf-8 
export LANG="$LC_ALL"
export TERM=xterm-256color
export LC_TIME=en_US.utf-8 

export NVM_DIR="$HOME/.nvm"
 . "$(brew --prefix nvm)/nvm.sh"

# Set locale to utf8
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# export openssl directories
export OPENSSL_INCLUDE_DIR=`brew --prefix openssl`/include
export OPENSSL_LIB_DIR=`brew --prefix openssl`/lib

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-railscasts.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
