# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export DYLD_LIBRARY_PATH=/usr/local/mysql-5.5.22-osx10.6-x86_64/lib
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/Users/zbloom/.local/bin:/usr/local/mysq/bin:/usr/local/mysql-5.5.22-osx10.6-x86_64/bin:/Users/zbloom/.local/lib/node_modules/handlebars/bin/
export EDITOR=/usr/bin/vim
alias git='hub'
export GITHUB_HOST='git.hubteam.com'
export WORKON_HOME=~/dev/virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
export PIP_VIRTUALENV_BASE=
export PIP_RESPECT_VIRTUALENV=true
alias git='hub'
export GITHUB_HOST='git.hubteam.com'
export WORKON_HOME=~/dev/virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
export PIP_VIRTUALENV_BASE=/Users/zbloom/dev/virtualenvs
export PIP_RESPECT_VIRTUALENV=true

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
