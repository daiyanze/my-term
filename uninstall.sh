#!/bin/sh

# Exit on command fails
set -o errexit

read -r -p "Is it okay to continue the uninstallation (make sure to backup config files)? [Y/n]" input

case $input in
  "");;
  [yY][eE][sS]|[yY]) echo 'Removing my-term...'; break;;
  [nN][oO]|[nN]) echo 'exit.'; exit 1; break;;
  *) echo 'Invalid input (hint: Y/n)'; exit 1;;
esac


remove_deps () {
  # AstroNvim
  rm -rf "$HOME/.config/nvim/"

  # Oh my zsh
  rm -rf "$HOME/.oh-my-zsh"

  # Tmux
  rm -rf "$HOME/.tmux"
}

remove_symlinks () {
  # AstroNvim
  unlink "$HOME/.config/nvim/lua/user/init.lua"

  # Tmux 
  unlink "$HOME/.tmux.conf"
  
  # Power10k
  unlink "$HOME/.p10k.zsh"

  # Oh my zsh
  unlink "$HOME/.zshrc"
}

remove_my_term () {
  rm -rf "$HOME/.config/my-term"
}


remove_deps
remove_symlinks
remove_my_term

echo 'Done.'
