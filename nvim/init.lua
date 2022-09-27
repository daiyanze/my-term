return {
  colorscheme = "gruvbox-material",

  options = {
    g = {
      -- Theme gruvbox-material
      gruvbox_material_palette = 'mix',
      gruvbox_material_enable_italic = 1,
      -- gruvbox_material_enable_bold = 1,

      -- Leetcode
      leetcode_solution_filetype = 'javascript',
      leetcode_browser = 'chrome',
    }
  },

  lsp = {
    -- This is to resolve the following warning:
    -- warning: multiple different client offset_encodings detected for buffer, this is not supported yet
    skip_setup = { "clangd" },
    ["server-settings"] = {
      clangd = {
        capabilities = {
          offsetEncoding = "utf-16",
        },
      },
    },
  },

  ["which-key"] = {
    register_mappings = {
      n = {
        ["<leader>"] = {
          ["d"] = { name = "Debugger" },
        },
      },
    },
  },

  mappings = {
    n = {
      -- Override
      ["<leader>th"] = { "<cmd>ToggleTerm direction=horizontal<cr>", desc = "ToggleTerm horizontal split" },
      ["<leader>tv"] = { "<cmd>ToggleTerm direction=vertical<cr>", desc = "ToggleTerm vertical split" },
      ["<leader>d"] = "",

      -- Move current line / block with Alt-j/k a la vscode.
      ["<M-j>"] = ":m .+1<CR>==",
      ["<M-k>"] = ":m .-2<CR>==",

      -- Debugger
      ["<leader>du"] = { '<cmd>PackerLoad nvim-dap-ui<CR> <bar> <cmd>lua require("dapui").toggle()<CR>', desc = "Toggle Dap UI" },
      ["<leader>dc"] = { "<cmd>DapContinue<CR>", desc = "Continue" },
      ["<leader>di"] = { "<cmd>DapStepInto<CR>", desc = "Step Into" },
      ["<leader>do"] = { "<cmd>DapStepOut<CR>", desc = "Step Out" },
      ["<leader>dv"] = { "<cmd>DapStepOver<CR>", desc = "Step Over" },
      ["<leader>dt"] = { "<cmd>DapToggleBreakpoint<CR>", desc = "Toggle Breakpoint" },
      ["<leader>dn"] = { "<cmd>DapTerminate<CR>", desc = "Terminate" },
      ["<leader>ds"] = { '<cmd>lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Breakpoint condition: "))<CR>', desc = "Set Breakpoint Condition" },
      ["<leader>dl"] = { '<cmd>lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', desc = "Log point message" },
      ["<leader>dr"] = { '<cmd>lua require("dap").repl.open()<CR>', desc = "Open REPL" },
      ["<leader>da"] = { '<cmd>lua require("dap").repl.open()<CR>', desc = "Run Last" },
      ["<leader>dk"] = { '<cmd>lua require("dapui").eval()<CR>', desc = "Hover Variable" },
    },
    v = {
      -- Move selected line / block of text in visual mode
      ["K"] = ":move '<-2<CR>gv-gv",
      ["J"] = ":move '>+1<CR>gv-gv",

      -- Move current line / block with Alt-j/k ala vscode.
      ["<A-j>"] = ":m '>+1<CR>gv-gv",
      ["<A-k>"] = ":m '<-2<CR>gv-gv",
    },
  },

  plugins = {
    toggleterm = {
      size = function(term)
        if term.direction == "horizontal" then
          return 10
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end
    },

    -- Extra custom plugins
    init = {
      { "sainnhe/gruvbox-material" },
      { "martinda/Jenkinsfile-vim-syntax"},
      { "mg979/vim-visual-multi"},
      { "nacro90/numb.nvim",
        config = function()
          require('numb').setup()
        end
      },
      { "ianding1/leetcode.vim" },
      { "mattn/emmet-vim" },
      { "mfussenegger/nvim-dap",
        config = function()
          vim.fn.sign_define('DapBreakpoint', {text='', texthl='', linehl='', numhl=''})
          vim.fn.sign_define('DapBreakpointCondition', {text='', texthl='', linehl='', numhl=''})
          vim.fn.sign_define('DapBreakpointRejected', {text='', texthl='', linehl='', numhl=''})
          vim.fn.sign_define('DapLogPoint', {text='קּ', texthl='', linehl='', numhl=''})
          vim.fn.sign_define('DapStopped', {text='ﱢ', texthl='', linehl='', numhl=''})
        end
      },
      { "rcarriga/nvim-dap-ui",
        opt = true,
        config = function()
          require('dapui').setup({
            layouts = {
              {
                elements = {
                  { id = "watches", size = 0.20 },
                  { id = "stacks", size = 0.20 },
                  { id = "breakpoints", size = 0.20 },
                  { id = "scopes", size = 0.40 },
                },
                size = 64,
                position = "left",
              },
              {
                elements = {
                  "repl",
                  "console",
                },
                size = 0.20,
                position = "bottom",
              },
            },
          })
        end
      },
      { "microsoft/vscode-js-debug",
        run = "npm install --legacy-peer-deps && npm run compile",
      },
      { "mxsdev/nvim-dap-vscode-js",
        requires = {'microsoft/vscode-js-debug'},
        opt = true,
        config = function()
          require("dap-vscode-js").setup({
            node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
            -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation. 
            adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
          })

          for _, language in ipairs({ "typescript", "javascript" }) do
            require("dap").configurations[language] = {
              {
                type = "pwa-node",
                request = "launch",
                name = "Launch file",
                program = "${file}",
                cwd = "${workspaceFolder}",
              },
              {
                type = "pwa-node",
                request = "attach",
                name = "Attach",
                processId = require'dap.utils'.pick_process,
                cwd = "${workspaceFolder}",
              }
            }
          end
        end
      },
      { "theHamsta/nvim-dap-virtual-text" },
    },
  },
}
