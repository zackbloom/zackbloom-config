ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

DISABLE_AUTO_UPDATE="true"

plugins=(git rails ruby)

source $ZSH/oh-my-zsh.sh

set -o vi

unsetopt correct_all
unsetopt sharehistory

alias hubspot='fab -f ~/dev/src/workstation_setup/deployfile.py'

export GITHUB_HOST='git.hubteam.com'

export DYLD_LIBRARY_PATH=/usr/local/mysql-5.5.22-osx10.6-x86_64/lib
export PATH=/Users/zackbloom/dev/virtualenvs/deploy_deploy/bin/
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/Users/zbloom/.local/bin:/usr/local/mysq/bin:/usr/local/mysql-5.5.22-osx10.6-x86_64/bin:/Users/zbloom/.local/lib/node_modules/handlebars/bin/
export PATH=$PATH:/usr/local/Cellar/ruby/1.9.3-p194/bin
export EDITOR=/usr/bin/vim

export GITHUB_HOST='git.hubteam.com'
export WORKON_HOME=~/dev/virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
export PIP_VIRTUALENV_BASE=
export PIP_RESPECT_VIRTUALENV=true

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

rvm use ruby-1.9.3

alias number='awk "'"{ print FNR "\t" $0 }"'"'

alias animal="curl -s 'http://animals.ivolo.me/?index=8'"
alias fact="elinks -dump randomfunfacts.com | sed -n '/^| /p' | tr -d \|"
alias dep="fact; deployer -u zbloom deploy:contacts_web && deployer -u zbloom deploy_static:contacts_web"
alias depprod="animal; fact; deployer  -u zbloom deploy:contacts_web,hs_env=prod && deployer -u zbloom deploy_static:contacts_web,hs_env=prod"
alias gs="git status -s"
alias gcam="git commit -a -m"
alias gca="git commit -a"
alias gcm="git commit -m"
alias gd="git diff"
alias gpom="git push origin master"
alias gpo="git push origin"
alias glom="git pull origin master"
alias glo="git pull origin"

bindkey -v

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

. ~/.virtualenvchdir.sh
