ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

DISABLE_AUTO_UPDATE="true"

export HOMEBREW_NO_AUTO_UPDATE=1

plugins=(git rails ruby)

source $ZSH/oh-my-zsh.sh

set -o vi

unsetopt correct_all
unsetopt sharehistory

export DYLD_LIBRARY_PATH=/usr/local/mysql-5.5.22-osx10.6-x86_64/lib
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin:/opt/local/bin:/usr/X11/bin:/Users/zbloom/.local/bin:/usr/local/mysq/bin:/usr/local/mysql-5.5.22-osx10.6-x86_64/bin:/Users/zbloom/.local/lib/node_modules/handlebars/bin/
export PATH=$PATH:/usr/local/Cellar/ruby/1.9.3-p194/bin
export EDITOR=/usr/bin/vim

alias number='awk "'"{ print FNR "\t" $0 }"'"'

alias animal="curl -s 'http://animals.ivolo.me/?index=8'"
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
alias gpom="git push origin main"
alias gphm="git push heroku main"
alias gpo="git push origin"
alias glom="git pull origin main"
alias glo="git pull origin"
alias ports="lsof -nP -iTCP -sTCP:LISTEN | grep"

function fr() {
  grep -rF --exclude-dir=node_modules "$*" .
}
function fri() {
  grep -riF --exclude-dir=node_modules "$*" .
}

bindkey -v

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/lib/node_modules:$PATH"

export GOPATH=~/go
export PATH=~/go/bin:$PATH

###-begin-npm-completion-### #
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

ssh-add ~/.ssh/id_rsa
bindkey "^R" history-incremental-search-backward
