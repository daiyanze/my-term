return {
  override_options = {
    signs = {
      add = { hl = "diffadd", text = "▎", numhl = "gitsignsaddnr" },
      change = { hl = "diffchange", text = "▎", numhl = "gitsignschangenr" },
      delete = { hl = "DiffDelete", text = "契", numhl = "GitSignsDeleteNr" },
      topdelete = { hl = "DiffDelete", text = "契", numhl = "GitSignsDeleteNr" },
      changedelete = { hl = "DiffChangeDelete", text = "~", numhl = "GitSignsChangeNr" },
    },
  }
}
