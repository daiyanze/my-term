-- First read our docs (completely) then check the example_config repo

local M = {}

require 'custom.core.options'

M.plugins = require 'custom.plugins'

M.mappings = require 'custom.core.mappings'

M.ui = {
  theme = "gruvbox_material"
}

return M
