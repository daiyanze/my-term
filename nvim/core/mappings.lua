return {
  disabled = {
    -- NvChad Original mapping
    n = {
      ["<C-n>"] = "",
      ["<leader>tt"] = "",
      ["<leader>ra"] = "",
      ["<leader>ca"] = "",
      ["<leader>f"] = "",
      ["<leader>fm"] = "",
      ["<leader>q"] = "",
      ["<leader>n"] = "",
    },
  },
  general = {
    n = {
      -- NvimTree
      -- toggle
      ["<leader>e"] = {"<cmd> NvimTreeToggle <CR>", "Explore"},
    },
    v = {
      -- Better indenting
      ["<"] = {"<gv", "Left indent"},
      [">"] = {">gv", "Right indent"},
    },
    x = {
      -- Move selected line / block of text in visual mode
      ["<S-j>"] = {":move '>+1<CR>gv-gv", "Move line up"},
      ["<S-k>"] = {":move '<-2<CR>gv-gv", "Move line down"},
    }
  }
}
