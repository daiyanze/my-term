# My-term
My good-looking productive terminal environment integration for MacOS with an easy installation.

## Components
- Editor: [Neovim (> 0.5)](https://neovim.io)
- Shell: [Zsh](https://www.zsh.org) + [Oh-My-Zsh](https://ohmyz.sh)
- Shell Theme: [Powerlevel10k](https://github.com/romkatv/powerlevel10k) -- pure
- Multiplexer: [Tmux](https://github.com/tmux/tmux)

## Screenshots
![snapshot](./snapshot_1.png)

## One Command Install
This command will backup the existed config files.
```sh
bash <(curl -s https://raw.githubusercontent.com/daiyanze/my-term/master/install.sh)
```

## Customizations & Plugins for each of the "Components"

### Neovim
The Neovim version should be higher than 0.5.
The configuration is based on [LunarVim](https://github.com/ChristianChiarulli/LunarVim). Added some personal favor customizations.

##### Theme:
The default theme of [LunarVim](https://github.com/ChristianChiarulli/LunarVim) is Lunar. I changed it into Gruvbox via these plugins [npxbr/gruvbox.nvim](https://github.com/npxbr/gruvbox.nvim) and [rktjmp/lush.nvim](https://github.com/rktjmp/lush.nvim).

##### Plugins:
- [nvim-scrollview](https://github.com/dstein64/nvim-scrollview):
- [neoscroll.nvim](https://github.com/neoscroll.nvim):
- [neovim tagbar](https://github.com/preservim/tagbar):
- [Jenkinsfile syntax](https://github.com/martinda/Jenkinsfile-vim-syntax):
- [vim visual multi](https://github.com/mg979/vim-visual-multi):
- [nvim dap ui](https://github.com/rcarriga/nvim-dap-ui):
- [wfxr/minimap.vim](https://github.com/wfxr/minimap.vim):
- [npxbr/gruvbox.nvim](https://github.com/npxbr/gruvbox.nvim):

### Tmux
##### Theme:
The terminal theme is set to Gruvbox by this plugin [egel/tmux-gruvbox](https://github.com/egel/tmux-gruvbox).

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
