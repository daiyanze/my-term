-- Settings
O.lang.tsserver.autoformat = false

-- Theme Gruvbox
O.colorscheme = 'gruvbox'

-- Javascript
O.lang.tsserver.formatter = 'prettier'
O.lang.tsserver.linter = nil
O.lang.tsserver.autoformat = true

-- Custom Plugins
O.user_plugins = {
  {'dstein64/nvim-scrollview'},
  {'martinda/Jenkinsfile-vim-syntax'},
  {'mg979/vim-visual-multi'},
  {'andymass/vim-matchup'},
  {'liuchengxu/vista.vim'},
  {'itchyny/vim-cursorword',
    event = {"BufEnter", "BufNewFile"}
  },
  {"kana/vim-niceblock",
    opt = true
  }
}

