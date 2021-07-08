# My-term

My good-looking productive terminal environment integration for MacOS with an easy installation.

## Components

- Package Manager: [Homebrew](https://brew.sh)
- Editor: [Neovim (>= 0.5)](https://neovim.io)
- Editor Configuration: [LunarVim](https://github.com/ChristianChiarulli/LunarVim) -- Gruvbox
- Shell: [Zsh](https://www.zsh.org) + [Oh-My-Zsh](https://ohmyz.sh)
- Shell Theme: [Powerlevel10k](https://github.com/romkatv/powerlevel10k) -- pure
- Multiplexer: [Tmux](https://github.com/tmux/tmux)

## Screenshots

![snapshot](./media/snapshot_1.png)
![snapshot](./media/snapshot_2.png)

## One Command Install

(TODO) Update install script

This command will backup the existed config files.

```sh
bash <(curl -s https://raw.githubusercontent.com/daiyanze/my-term/master/install.sh)
```

## Customizations & Plugins for each of the "Components"

### Neovim

The Neovim version should be higher than 0.5.
The configuration is based on [LunarVim](https://github.com/ChristianChiarulli/LunarVim). Added some personal favor customizations.

##### Plugins:

- [nvim-scrollview](https://github.com/dstein64/nvim-scrollview): Displays a scrollbar
- [neoscroll.nvim](https://github.com/neoscroll.nvim): Makes scrolling much smoother
- [neovim tagbar](https://github.com/preservim/tagbar): To browse the tags of the current file. This requires collaboration with [ctags-exuberant](https://formulae.brew.sh/formula/ctags#default).
- [Jenkinsfile syntax](https://github.com/martinda/Jenkinsfile-vim-syntax): Helps highlight Groovy syntax in Jenkinsfile
- [vim visual multi](https://github.com/mg979/vim-visual-multi): A multiple text selector

### Tmux

##### Plugins:

- [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm): Helps manages the Tmux plugins
- [Tmux sensible](https://github.com/tmux-plugins/tmux-sensible): Basic Tmux settings everyone can agree on
- [Tmux pain control](https://github.com/tmux-plugins/tmux-pain-control): standard pane key-bindings for tmux
- [Tmux sessionist](https://github.com/tmux-plugins/tmux-sessionist): Persists tmux environment across system restarts.
- [Tmux resurrect](https://github.com/tmux-plugins/tmux-resurrect): Lightweight tmux utils for manipulating sessions
- [Tmux yank](https://github.com/tmux-plugins/tmux-yank): Copy texts to system clipboard
- [Tmux gruvbox](https://github.com/egel/tmux-gruvbox): A Custom theme (dark) enabled by default

## Key Bindings

(TODO)

## License

MIT
