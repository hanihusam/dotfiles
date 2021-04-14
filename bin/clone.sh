#!/bin/sh

echo "Cloning repositories..."

GITHUB=$HOME/Code/GitHub
GITLAB=$HOME/Code/GitLab

# URL Shorteners
if [[ ! -d "$GITLAB/kawalcovid19/kcov.id" ]] ; then
  git clone git@gitlab.com:kawalcovid19/website/kcov.id.git $GITLAB/kawalcovid19/kcov.id
fi


