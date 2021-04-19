#!/bin/sh

##################
# Platforms      #
##################

# Add path for Homebrew
export PATH=/opt/homebrew/bin:$PATH

# Golang
export GOPATH=$HOME/Code/go

# Hide partial line indicator (%) a.k.a. prompt end-of-line mark
PROMPT_EOL_MARK=''

# Fix "zsh: no matches found:" error when running URL Shorteners scripts down below
# https://unix.stackexchange.com/a/310553/467307
# http://zsh.sourceforge.net/Doc/Release/Options.html#Expansion-and-Globbing
setopt nonomatch

# Automatically change directories without "cd" command
# http://zsh.sourceforge.net/Doc/Release/Options.html#Changing-Directories
setopt autocd

##################
# Custom Scripts #
##################


# Export secret environment variables
if [ -f "$HOME/.secrets.zsh" ]; then
  source $HOME/.secrets.zsh
fi


# URL Shorteners
# https://github.com/kentcdodds/netlify-shortener#bash
zainf() { node $HOME/Code/GitHub/zainfathoni/shortener/node_modules/.bin/netlify-shortener "$1" "$2"; }
rbagi() { node $HOME/Code/GitHub/zainfathoni/rbagi.id/node_modules/.bin/netlify-shortener "$1" "$2"; }
imas() { node $HOME/Code/GitHub/zainfathoni/s.imas.sg/node_modules/.bin/netlify-shortener "$1" "$2"; }
kcovid() { node $HOME/Code/GitLab/kawalcovid19/website/kcov.id/node_modules/.bin/netlify-shortener "$1" "$2"; }
feid() { node $HOME/Code/GitHub/frontend-id/s.feid.dev/node_modules/.bin/netlify-shortener "$1" "$2"; }

# Ninja Van Kubernetes context switching
alias kube-prod='source ~/scripts/bin/kube/production.zsh'
alias kube-dev='source ~/scripts/bin/kube/development.zsh'
