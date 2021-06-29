-- --------------
-- Customizations
-- --------------

-- Tagbar
vim.api.nvim_set_keymap("n", "<leader>t", ":TagbarToggle<CR>", {noremap = true, silent = true})

-- Which-key
require("which-key").register(
  {
      ["t"] = "Tagbar",
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

-- Theme Gruvbox
vim.cmd([[colorscheme gruvbox]])

