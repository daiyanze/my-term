return {
  ['martinda/Jenkinsfile-vim-syntax'] = {},
  ['itchyny/vim-cursorword'] = {},
  ['nacro90/numb.nvim'] = {
    config = function()
      require('numb').setup()
    end
  },
  ['nvim-telescope/telescope.nvim'] = require 'custom.plugins.configs.telescope',
  ['gpanders/editorconfig.nvim'] = {},
  ['lewis6991/gitsigns.nvim'] = require 'custom.plugins.configs.gitsigns',
  ['mg979/vim-visual-multi'] = {},
  ['kyazdani42/nvim-tree.lua'] = require 'custom.plugins.configs.nvimtree',
  ['neovim/nvim-lspconfig'] = require 'custom.plugins.configs.lspconfig',
  ['folke/trouble.nvim'] = {},
  ['folke/which-key.nvim'] = require 'custom.plugins.configs.whichkey',
  ['mfussenegger/nvim-dap'] = require 'custom.plugins.configs.dap',
  ['rcarriga/nvim-dap-ui'] = require 'custom.plugins.configs.dapui',
  ['mxsdev/nvim-dap-vscode-js'] = require 'custom.plugins.configs.dapvscodejs',
  ['theHamsta/nvim-dap-virtual-text'] = {},
}
