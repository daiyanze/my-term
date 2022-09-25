#!/bin/sh

# Exit on command fails
set -o errexit

# create backup folder and move the existed configs
backup () {
    bkp_dir=$HOME/.my-term.bkp."$(date '+%Y%m%d%H%M%S')"
    mkdir -p $bkp_dir

    # backup nvim
    if [ -d $HOME/.config/nvim ]; then
        mv $HOME/.config/nvim $bkp_dir/
        echo "=== Moved .tmux.conf to backup folder $bkp_dir ==="
    fi

    # backup .tmux
    if [ -e $HOME/.tmux.conf ]; then
        mv $HOME/.tmux.conf $bkp_dir/
        echo "=== Moved .tmux.conf to backup folder $bkp_dir ==="
    fi

    # backup .zshrc
    if [ -e $HOME/.zshrc ]; then
        mv $HOME/.zshrc $bkp_dir/
        echo "=== Moved .zshrc to backup folder $bkp_dir ==="
    fi

    # backup powerlevel10k
    if [ -e $HOME/.p10k.zsh ]; then
        mv $HOME/.p10k.zsh $bkp_dir/
        echo "=== Moved .p10k.zsh to backup folder $bkp_dir ==="
    fi

    if [ -z "$(ls -A $bkp_dir)" ]; then
        echo 'All files backup done.'
    else
        rm -rf $bkp_dir
    fi 
}

# install my-term
install_my_term () {
    rm -rf $HOME/.config/my-term
    git clone https://github.com/daiyanze/my-term $HOME/.config/my-term
}

# install NvChad
install_NvChad () {
    git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
}

# install homebrew
install_homebrew () {
    command -v brew >/dev/null 2>&1 || { echo >&2 "Installing Homebrew Now"; \
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; }

    # packages
    brew install neovim
    # Refered to https://github.com/universal-ctags/homebrew-universal-ctags
    # brew tap universal-ctags/universal-ctags
    # brew install --HEAD universal-ctags/universal-ctags/universal-ctags

    brew install lua \
        ripgrep \
        fzf \
        tmux \
        efm-langserver \
        lazygit \
        gnu-sed \
        ripgrep
}

# install oh-my-zsh
install_oh_my_zsh () {
    echo 'Installing oh-my-zsh...'

    if [ ! -d $HOME/.oh-my-zsh ]; then
        git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/.oh-my-zsh
    fi

    # zsh plugins
    if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ]; then
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    fi

    if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]; then
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    fi

    if [ ! -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k ]; then
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    fi

    if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/evalcache ]; then
        git clone https://github.com/mroth/evalcache ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/evalcache
    fi

    if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-nvm ]; then
        git clone https://github.com/lukechilds/zsh-nvm ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-nvm
    fi
}

# install tmux plugin manager
install_tmux_plugin_manager () {
    if [ ! -d $HOME/.tmux/plugins/tpm ]; then
        git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
    fi
}

# Locate config files
setup_configs () {
    # zshrc
    ln -s -f $HOME/.config/my-term/zsh/zshrc.config $HOME/.zshrc
    echo "Created symlink to $HOME/.zshrc"

    # tmux
    ln -s -f $HOME/.config/my-term/tmux/tmux.conf $HOME/.tmux.conf
    echo "Created symlink to $HOME/.tmux.conf"

    # NvChad (neovim)
    ln -s -f $HOME/.config/my-term/nvim/chadrc.lua $HOME/.config/nvim/lua/custom/chadrc.lua
    ln -s $HOME/.config/my-term/nvim/plugins/ $HOME/.config/nvim/lua/custom
    ln -s $HOME/.config/my-term/nvim/core/ $HOME/.config/nvim/lua/custom

    echo "Created symlink to $HOME/.config/nvim/lua/custom"

    # powerlevel10k
    ln -s -f $HOME/.config/my-term/powerlevel10k/p10k.zsh $HOME/.p10k.zsh
    echo "Created symlink to $HOME/.p10k.zsh"
}

# Install Start Message
echo 'Installing My Term...'
echo ''

# Installation Processes
backup
install_my_term
install_NvChad
install_homebrew
install_oh_my_zsh
install_tmux_plugin_manager
echo ''
echo ''

# Setups
setup_configs

# Post-install Instructions
echo ''
echo ''
echo '=============================='
echo '   To complete installation' 
echo '=============================='

echo '--- Tmux ---'
echo "press <Prefix> + I (capital) to fetch the plugins ($HOME/.tmux/plugins) for the first-time of entering Tmux."
echo '------------'
echo ''

echo '--- Neovim ---'
echo "enter ':PackerInstall' to install the plugins for the first-time of entering Neovim"
echo '---------------'

