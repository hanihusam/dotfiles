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

# Use VI mode
# http://zsh.sourceforge.net/Doc/Release/Options.html#Zle
setopt vi

# Try to correct the spelling of commands
# http://zsh.sourceforge.net/Doc/Release/Options.html#Input_002fOutput
setopt dvorak

# Use the Dvorak keyboard for examining spelling mistakes
# http://zsh.sourceforge.net/Doc/Release/Options.html#Input_002fOutput
setopt correct

##################
# Custom Scripts #
##################


# Export secret environment variables
if [ -f "$HOME/.secrets.zsh" ]; then
  source $HOME/.secrets.zsh
fi


# URL Shorteners
# https://github.com/kentcdodds/netlify-shortener#bash
