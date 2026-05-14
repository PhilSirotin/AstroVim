return {
  -- Файловое дерево (neo-tree)
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = { width = 25 },
      filesystem = {
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    },
  },

  -- Outline / symbols справа (aerial)
  {
    "stevearc/aerial.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      layout = {
        max_width = { 35, 0.2 },
        min_width = 25,
        default_direction = "right",
        placement = "edge",
      },
      attach_mode = "global",
      backends = { "lsp", "treesitter" },
      show_guides = true,
    },
    keys = {
      { "<leader>a", "<cmd>AerialToggle<cr>", desc = "Toggle Outline" },
    },
  },

  -- Табы буферов сверху
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        mode = "buffers",
        separator_style = "slant",
        show_buffer_close_icons = true,
        show_close_icon = false,
        diagnostics = "nvim_lsp",
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            highlight = "Directory",
            separator = true,
          },
          {
            filetype = "aerial",
            text = "Outline",
            highlight = "Directory",
            separator = true,
          },
        },
      },
    },
    keys = {
      { "<Tab>",   "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
      { "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
      { "<leader>bx", "<cmd>bdelete<cr>",          desc = "Close Buffer" },
    },
  },

  -- Дебаггер UI снизу
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "folke/neodev.nvim",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup({
        layouts = {
          {
            elements = {
              { id = "scopes",      size = 0.4 },
              { id = "breakpoints", size = 0.2 },
              { id = "stacks",      size = 0.2 },
              { id = "watches",     size = 0.2 },
            },
            size = 12,
            position = "bottom",
          },
          {
            elements = {
              { id = "repl",    size = 0.5 },
              { id = "console", size = 0.5 },
            },
            size = 40,
            position = "right",
          },
        },
      })
      -- Автооткрытие при старте дебага
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
    end,
    keys = {
      { "<leader>du", "<cmd>lua require('dapui').toggle()<cr>", desc = "Toggle Debug UI" },
      { "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<cr>", desc = "Toggle Breakpoint" },
      { "<leader>dc", "<cmd>lua require('dap').continue()<cr>", desc = "Continue" },
      { "<leader>di", "<cmd>lua require('dap').step_into()<cr>", desc = "Step Into" },
      { "<leader>do", "<cmd>lua require('dap').step_over()<cr>", desc = "Step Over" },
    },
  },
}
