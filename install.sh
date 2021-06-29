#!/bin/sh

# Exit on command fails
set -o errexit

# create backup folder and move the existed tmux configs
backup () {
    if [ -d $HOME/.tmux ]; then
        bkp_dir=$HOME/.tmux.bkp."$(date '+%Y%m%d%H%M%S')"
        mv $HOME/.tmux $bkp_dir
        echo "Moved .tmux/ to backup folder $bkp_dir"
        echo ''
    fi
}

# clone repo
clone () {
    git clone https://github.com/daiyanze/my-tmux-config.git $HOME/.tmux
    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
    echo ''
}

# create symlink
symlink () {
    ln -s -f $HOME/.tmux/.tmux.conf $HOME/.tmux.conf
    echo "Created symlink to $HOME/.tmux.conf"
    echo ''
}

# Install Start Message
echo 'Installing My Tmux config...'
echo ''

# Backup .tmux folder
backup

# clone
clone

# link the config file
symlink

# Post-install Instructions
echo '========================'
echo 'To complete installation' 
echo '========================'
echo "press <Prefix> + I (capital) to fetch the plugins ($HOME/.tmux/plugins) after first-time of entering Tmux."
echo ''

# TODO: turn into installation
# install oh-my-zsh
# sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


# install zsh plugins
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# git clone https://github.com/mroth/evalcache ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/evalcache
# git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm

# install homebrew
# install components
# brew install neovim --HEAd
# brew install neovim --HEAD
# brew install lua node yarn ripgrep fzf ranger tmux
# brew tap homebrew/cask-fonts
# brew install --cask font-fira-code
# brew install --cask font-fira-code-nerd-font
# brew install goenv
# brew install ctags

# set git pager to "cat" to print out output and exit the program
# https://stackoverflow.com/questions/9483757/how-to-exit-git-log-or-git-diff
