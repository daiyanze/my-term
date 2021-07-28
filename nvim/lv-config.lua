--------------------------------------
---------- Editor Settings -----------
--------------------------------------

-- Theme Gruvbox
lvim.colorscheme = 'gruvbox-material'

-- Colorscheme for galaxyline
-- Based on sainnhe/gruvbox-material
-- https://github.com/sainnhe/gruvbox-material/blob/master/autoload/gruvbox_material.vim#L200
local colors = lvim.builtin.galaxyline.colors
colors.green = '#b0b846'
colors.purple = '#d3869b'
colors.magenta = '#db4740' -- bg_red
colors.orange = '#f28534'
colors.yellow = '#e9b143'
colors.red = '#f2594b'
colors.blue = '#80aa9e'
colors.cyan = '#8bba7f' -- aqua
colors.grey = '#928374' -- grey1
colors.alt_bg = '#32302f' -- bg_statusline1

-- Custom Plugins
lvim.plugins = {
  -- Theme
  {'sainnhe/gruvbox-material', opt = true},
  -- Utils
  {'dstein64/nvim-scrollview'},
  {'martinda/Jenkinsfile-vim-syntax'},
  {'mg979/vim-visual-multi'},
  {'jeffkreeftmeijer/vim-numbertoggle'},
  {'lukas-reineke/indent-blankline.nvim'},
  {'onsails/lspkind-nvim'},
  {'kdheepak/lazygit.nvim'},
  {'sindrets/diffview.nvim'},
  {'windwp/nvim-spectre'},
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
-- vim.g.gruvbox_material_enable_bold = 1

-- lukas-reineke/indent-blankline.nvim configs
vim.g.indent_blankline_char = '│'

