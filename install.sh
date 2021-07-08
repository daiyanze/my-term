#!/bin/sh

# Exit on command fails
set -o errexit

# create backup folder and move the existed configs
backup () {
    echo 'Moving to backup folder'
    bkp_dir=$HOME/.my-term.bkp."$(date '+%Y%m%d%H%M%S')"
    mkdir $bkp_dir

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
}

# install homebrew
install_homebrew () {
    echo 'Installing homebrew...'

    if [ ! -f '/usr/local/bin/brew' ]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    
    # packages
    brew install neovim --HEAD
    brew install --HEAD universal-ctags/universal-ctags/universal-ctags
    brew install lua \
        node \
        yarn \
        ripgrep \
        fzf \
        ranger \
        tmux \
        ccat \
        goenv \
        pyenv \
        efm-langserver

    brew tap homebrew/cask-fonts
    brew install --cask font-fira-code
    brew install --cask font-fira-code-nerd-font
}

# install oh-my-zsh
install_oh_my_zsh () {
    echo 'Installing oh-my-zsh...'

    if [ ! -d $HOME/.oh-my-zsh ]; then
        sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
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

# install lunarvim
install_lunarvim () {
    sh -c "$(curl -s https://raw.githubusercontent.com/ChristianChiarulli/lunarvim/master/utils/installer/install.sh)"
}

# Some customized settings
customize () {
    # set git pager to "cat" to print out output and exit the program
    # https://stackoverflow.com/questions/9483757/how-to-exit-git-log-or-git-diff
    echo 'set git pager to "cat"'
    git config --global core.pager cat
}

# Locate config files
setup_configs () {
    # zshrc
    ln -s -f $HOME/.config/my-term/zsh/zshrc.config $HOME/.zshrc
    echo "Created symlink to $HOME/.zshrc"

    # tmux
    ln -s -f $HOME/.config/my-term/tmux/.tmux.conf $HOME/.tmux.conf
    echo "Created symlink to $HOME/.tmux.conf"

    # neovim
    ln -s -f $HOME/.config/my-term/nvim/lv-config.lua $HOME/.config/nvim/lv-config.lua
    echo "Created symlink to $HOME/.config/nvim/lv-config.lua"

    # powerlevel10k
    ln -s -f $HOME/.config/my-term/powerlevel10k/p10k.zsh $HOME/.p10k.zsh
    echo "Created symlink to $HOME/.p10k.zsh"
}

# Install Start Message
echo 'Installing My Tmux config...'
echo ''

# Installation Processes
backup
install_homebrew
install_oh_my_zsh
install_tmux_plugin_manager
install_lunarvim
echo ''
echo ''

# Setups
customize
setup_configs

# Post-install Instructions
echo ''
echo ''
echo '=============================='
echo '   To complete installation' 
echo '=============================='

echo '--- Tmux ---'
echo "press <Prefix> + I (capital) to fetch the plugins ($HOME/.tmux/plugins) after first-time of entering Tmux."
echo '------------'
echo ''

echo '--- Neovim ---'
echo "Make sure to add the following line to the file: $HOME/.config/nvim/init.lua"
echo ''
echo "  vim.cmd('luafile ~/.config/my-term/nvim/nvim.config.lua')"
echo ''
echo "Then install the plugins using ':PackerInstall' after opening up Neovim"
echo '---------------'
