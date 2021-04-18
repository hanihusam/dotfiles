#!/bin/sh

# Export secret environment variables
if [ -f "$HOME/.secrets.zsh" ]; then
  source $HOME/.secrets.zsh
fi

# Golang
export GOPATH=$HOME/Code/go

# URL Shorteners
# https://github.com/kentcdodds/netlify-shortener#bash
zainf() { node $HOME/Code/GitHub/zainfathoni/shortener/node_modules/.bin/netlify-shortener "$1" "$2"; }
rbagi() { node $HOME/Code/GitHub/zainfathoni/rbagi.id/node_modules/.bin/netlify-shortener "$1" "$2"; }
imas() { node $HOME/Code/GitHub/zainfathoni/s.imas.sg/node_modules/.bin/netlify-shortener "$1" "$2"; }
kcovid() { node $HOME/Code/GitLab/kawalcovid19/website/kcov.id/node_modules/.bin/netlify-shortener "$1" "$2"; }
feid() { node $HOME/Code/GitHub/frontend-id/s.feid.dev/node_modules/.bin/netlify-shortener "$1" "$2"; }

# Ninja Van Kubernetes context switching
alias kube-prod='source ~/.nv/kube/production.zsh'
alias kube-dev='source ~/.nv/kube/development.zsh'