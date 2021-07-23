--------------------------------------
---------- Editor Settings -----------
--------------------------------------

-- Theme Gruvbox
O.colorscheme = 'gruvbox-material'

-- Javascript
O.lang.tsserver.formatter = 'prettier'
O.lang.tsserver.linter = 'eslint'

-- Custom Plugins
O.user_plugins = {
  -- Theme
  {'sainnhe/gruvbox-material'},
  -- Utils
  {'dstein64/nvim-scrollview'},
  {'martinda/Jenkinsfile-vim-syntax'},
  {'mg979/vim-visual-multi'},
  {'jeffkreeftmeijer/vim-numbertoggle'},
  {'lukas-reineke/indent-blankline.nvim'},
  {'onsails/lspkind-nvim'},
  {'kdheepak/lazygit.nvim'},
  {'sindrets/diffview.nvim'},
  {'nacro90/numb.nvim',
    config = function()
      require('numb').setup()
    end
  },
  {'andymass/vim-matchup'},
  {'liuchengxu/vista.vim'},
  {'itchyny/vim-cursorword',
    event = {"BufEnter", "BufNewFile"}
  },
  {"kana/vim-niceblock",
    opt = true
  }
}

-- Custom plugin settings

-- sainnhe/gruvbox-material configs
vim.g.gruvbox_material_palette = 'mix'
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_enable_bold = 1

-- lukas-reineke/indent-blankline.nvim configs
vim.g.indent_blankline_char = '│'

