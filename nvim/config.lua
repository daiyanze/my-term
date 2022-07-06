--------------------------------------
---------- Editor Settings -----------
--------------------------------------

-- Prettier Format
lvim.format_on_save = false
-- Theme Gruvbox
lvim.colorscheme = 'gruvbox-material'

-- Custom Plugins
lvim.plugins = {
  -- Theme
  {'sainnhe/gruvbox-material'},
  -- Utils
  {'dstein64/nvim-scrollview'},
  {'martinda/Jenkinsfile-vim-syntax'},
  {'mg979/vim-visual-multi'},
  {'mattn/emmet-vim'},
  {'jeffkreeftmeijer/vim-numbertoggle'},
  {'lukas-reineke/indent-blankline.nvim'},
  {'onsails/lspkind-nvim'},
  {'kdheepak/lazygit.nvim'},
  -- {'sindrets/diffview.nvim'},
  {'windwp/nvim-spectre'},
  {'nacro90/numb.nvim',
    config = function()
      require('numb').setup()
    end
  },
  {'andymass/vim-matchup'},
  {'liuchengxu/vista.vim'},
  {'itchyny/vim-cursorword',
    event = {'BufEnter', 'BufNewFile'}
  },
  {'gpanders/editorconfig.nvim'},
  {'kana/vim-niceblock',
    opt = true
  },
  {'tpope/vim-obsession'},
  {'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require("todo-comments").setup {
        -- The colors are copied from the gruvbox-material "mix" theme
        colors = {
          error = { "DiagnosticError", "ErrorMsg", "#db4740" },
          warning = { "DiagnosticWarning", "WarningMsg", "#e9b143" },
          info = { "DiagnosticInfo", "#80aa9e" },
          hint = { "DiagnosticHint", "#b0b846" },
          default = { "Identifier", "#d3869b" },
        }
      }
    end
  }
}

-- Custom plugin settings

-- sainnhe/gruvbox-material configs
vim.g.gruvbox_material_palette = 'mix'
vim.g.gruvbox_material_enable_italic = 1
-- vim.g.gruvbox_material_enable_bold = 1

-- lukas-reineke/indent-blankline.nvim configs
vim.g.indent_blankline_char = '│'

