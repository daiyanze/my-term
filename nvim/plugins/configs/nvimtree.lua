return {
  override_options = {
    system_open = {
      cmd = nil,
      args = {},
    },
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = false,
    hijack_directories = {
      enable = true,
      auto_open = true,
    },
    auto_reload_on_write = true,
    diagnostics = {
      enable = true,
      show_on_dirs = false,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
    },
    view = {
      width = 30,
      adaptive_size = false,
      hide_root_folder = false,
      preserve_window_proportions = false,
      mappings = {
        custom_only = false,
        list = {},
      },
      number = false,
      relativenumber = false,
      signcolumn = "yes",
    },
    git = {
      enable = true,
      ignore = false,
      timeout = 200,
    },
    renderer = {
      highlight_git = true,
      root_folder_modifier = ":t",
      icons = {
        show = {
          git = true
        },
        glyphs = {
          folder = {
            default = "",
            open = "",
            empty = "",
            empty_open = "",
          },
          git = {
            unstaged = "",
            staged = "S",
            untracked = "U",
          },
        }
      }
    }
  }
}
