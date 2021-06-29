-- --------------
-- Customizations
-- --------------

-- Custom Key mappings

-- Tagbar
vim.api.nvim_set_keymap("n", "<leader>t", ":TagbarToggle<CR>", {noremap = true, silent = true})

-- Minimap
vim.api.nvim_set_keymap("n", "<leader>m", ":MinimapToggle<CR>", {noremap = true, silent = true})

-- Which-key
require("which-key").register(
  {
      ["t"] = "Tagbar",
      ["m"] = "Minimap",
  },
  {
      mode = "n", -- NORMAL mode
      prefix = "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = false -- use `nowait` when creating keymaps
  }
)

-- Custom Plugins

require("packer").use('dstein64/nvim-scrollview')
require("packer").use('preservim/tagbar')
require("packer").use('karb94/neoscroll.nvim')
require("neoscroll").setup()
require("packer").use('martinda/Jenkinsfile-vim-syntax')
require("packer").use('mg979/vim-visual-multi')
require("packer").use('rcarriga/nvim-dap-ui')
-- require("packer").use {
--    'folke/todo-comments.nvim',
--    requires = 'nvim-lua/plenary.nvim',
-- }
-- require("todo-comments").setup()

-- Theme Gruvbox
require("packer").use {
    'npxbr/gruvbox.nvim',
    requires = 'rktjmp/lush.nvim',
}

-- Theme Enable on Start
vim.cmd([[colorscheme gruvbox]])

require("packer").use('wfxr/minimap.vim')

vim.g.minimap_highlight_range = 1
vim.g.minimap_width = 10
vim.g.minimap_auto_start = 0
vim.g.minimap_auto_start_win_enter = 1
vim.g.minimap_git_colors = 1
vim.g.minimap_highlight = 'MinimapCurrentLine'

-- Minimap set highlight on current line
vim.cmd([[highlight MinimapCurrentLine ctermfg=Green guifg=#50FA7B guibg=#32302f]])
