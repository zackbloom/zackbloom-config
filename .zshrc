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
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin:/opt/local/bin:/usr/X11/bin:/Users/zbloom/.local/bin:/usr/local/mysq/bin:/usr/local/mysql-5.5.22-osx10.6-x86_64/bin:/Users/zbloom/.local/lib/node_modules/handlebars/bin/
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

alias animal="curl -s 'http://animals.ivolo.me/'"
alias fact="elinks -dump randomfunfacts.com | sed -n '/^| /p' | tr -d \|"
alias dep="fact; deployer -u zbloom deploy:contacts_web"
alias depprod="animal; fact; deployer  -u zbloom deploy:contacts_web,hs_env=prod"
alias depembed="deployer deploy:ContactEmbed,loglevel=debug && curl 'https://app.hubspotqa.com/contact_embed/53/459428/AO_T-mMY5tE5hJvyChiKDaPKAjcjjSoo7Joc5sMxV8KfU71xAZBG0-BdR0QMx_PWmPXjiEeUFwFDLT8YVn2HHQV0e7GNqK1X4dxYNhRunr9tkfF-S1WY_CI/'"
alias depembedprod="deployer deploy:ContactEmbed,loglevel=debug,prod"
alias gs="git status -s"
alias gcam="git commit -a -m"
alias gca="git commit -a"
alias gcm="git commit -m"
alias gd="git diff"
alias gpom="git push origin master"
alias gpo="git push origin"
alias glom="git pull origin master"
alias glo="git pull origin"
alias fr="fgrep -r"
alias fri="fgrep -ri"

bindkey -v

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="/usr/local/lib/node_modules:$PATH"

. ~/.virtualenvchdir.sh
###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _npm_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###
