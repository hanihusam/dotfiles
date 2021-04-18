#!/bin/sh

ln -s "$HOME/Box Sync/dotfiles/secrets.zsh" "$HOME/.dotfiles/.secrets.zsh"
ln -s "$HOME/Box Sync/dotfiles/kube" "$HOME/.dotfiles/kube"

$HOME/.dotfiles/install
