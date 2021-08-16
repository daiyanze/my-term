#!/bin/sh

# Exit on command fails
set -o errexit

remove_deps () {
  # Lunarvim
  sh $HOME/.local/share/lunarvim/lvim/utils/installer/uninstall.sh

  # Oh my zsh
  rm -rf $HOME/.oh-my-zsh

  # Tmux
  rm -rf $HOME/.tmux
}

remove_symlinks () {
  # Tmux 
  unlink $HOME/.tmux.conf
  
  # Power10k
  unlink $HOME/.p10k.zsh

  # Oh my zsh
  unlink $HOME/.zshrc
}

remove_my_term () {
  rm -rf $HOME/.config/my-term
}

echo 'Removing my-term...'

remove_deps
remove_symlinks
remove_my_term

echo 'Done.'
