export PATH="$PATH:/Users/thsieh/Scripts:/usr/local/opt/inetutils/libexec/gnubin:/Users/thsieh/Library/Python/3.6/bin:~/.npm-global/bin"
export PATH="/Users/thsieh/home/otpl-deploy-scripts/bin:$PATH"
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
export MANPATH="/usr/local/opt/inetutils/libexec/gnuman:$(man --path)"

source ~/Scripts/utilfn

export PS1="\[\e[1;2;37m\]\A\[\e[m\] \[\e[1;90m\]\w\[\e[m\]\[\e[38;5;28m\]\$(git branch 2>/dev/null | grep '^*' | colrm 1 2 | sed -e 's/^/:/')\[\e[m\] \[\e[1;36m\]=>\[\e[m\] "
alias ls="ls -G"
alias libtool="glibtool"
alias define="definition"
alias quote=ticker

# Perl config for Ack
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Git bash-completion: requires https://github.com/git/git/blob/master/contrib/completion/git-completion.bash
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Git GPG signature config
export GPG_TTY=$(tty)

# Ruby stuff
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
export RBENV_ROOT=/usr/local/var/rbenv # https://github.com/rbenv/rbenv/issues/938
export RAILS_ENV=development
alias be="bundle exec"

# Node stuff
export NODE_ENV=development
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Automake/autoconf stuff for FreeTDS
export PATH="/usr/local/opt/gettext/bin:$PATH"

# Convenience
alias h="cd /Users/thsieh/home"

# MacOS stuff
export BASH_SILENCE_DEPRECATION_WARNING=1 # suppresses zsh shill

# Golang
export GO111MODULE=on
export GOBIN='/Users/thsieh/go/bin'
export GONOSUMDB="github.com/opentable/*"
