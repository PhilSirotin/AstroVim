return {
  {
    "wojciech-kulik/xcodebuild.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-tree.lua",
    },
    config = function()
      require("xcodebuild").setup({
        code_coverage = { enabled = true },
      })
    end,
    keys = {
      { "<leader>X",  "<cmd>XcodebuildPicker<cr>",           desc = "Xcodebuild Actions" },
      { "<leader>xb", "<cmd>XcodebuildBuild<cr>",            desc = "Build" },
      { "<leader>xr", "<cmd>XcodebuildBuildRun<cr>",         desc = "Build & Run" },
      { "<leader>xc", "<cmd>XcodebuildClean<cr>",            desc = "Clean Build" },
      { "<leader>xt", "<cmd>XcodebuildTest<cr>",             desc = "Run Tests" },
      { "<leader>xT", "<cmd>XcodebuildTestClass<cr>",        desc = "Run This Test Class" },
      { "<leader>xd", "<cmd>XcodebuildSelectDevice<cr>",     desc = "Select Device" },
      { "<leader>xs", "<cmd>XcodebuildSelectScheme<cr>",     desc = "Select Scheme" },
      { "<leader>xo", function()
          local project = vim.fn.glob(vim.fn.getcwd() .. "/*.xcodeproj")
          if project ~= "" then
            vim.fn.system("open '" .. project .. "'")
            vim.notify("Opening in Xcode...", vim.log.levels.INFO)
          else
            local workspace = vim.fn.glob(vim.fn.getcwd() .. "/*.xcworkspace")
            if workspace ~= "" then
              vim.fn.system("open '" .. workspace .. "'")
              vim.notify("Opening in Xcode...", vim.log.levels.INFO)
            else
              vim.notify("Xcode project not found", vim.log.levels.WARN)
            end
          end
        end,
        desc = "Open in Xcode"
      },
      { "<leader>xf", function()
          local file = vim.api.nvim_buf_get_name(0)
          if file ~= "" then
            vim.fn.system("open -a Xcode '" .. file .. "'")
            vim.notify("Opening file in Xcode...", vim.log.levels.INFO)
          end
        end,
        desc = "Open File in Xcode"
      },
      { "<leader>xe", "<cmd>Neotree toggle<cr>",                          desc = "File Explorer" },
      { "<leader>xa", "<cmd>AerialToggle<cr>",                            desc = "Outline" },
      { "<leader>xdu", "<cmd>lua require('dapui').toggle()<cr>",          desc = "Toggle Debug UI" },
      { "<leader>xdb", "<cmd>lua require('dap').toggle_breakpoint()<cr>", desc = "Toggle Breakpoint" },
      { "<leader>xdc", "<cmd>lua require('dap').continue()<cr>",          desc = "Continue Debug" },
      { "<leader>xdi", "<cmd>lua require('dap').step_into()<cr>",         desc = "Step Into" },
      { "<leader>xdo", "<cmd>lua require('dap').step_over()<cr>",         desc = "Step Over" },
    },
  },

  {
    "keith/swift.vim",
    ft = "swift",
  },

  {
    "AstroNvim/astrolsp",
    opts = {
      servers = { "sourcekit" },
      config = {
        sourcekit = {
          cmd = {
            vim.fn.trim(vim.fn.system("xcrun --find sourcekit-lsp")),
          },
          capabilities = {
            workspace = {
              didChangeWatchedFiles = { dynamicRegistration = true },
            },
          },
          root_dir = function(filename)
            local util = require("lspconfig.util")
            return util.root_pattern("buildServer.json")(filename)
              or util.root_pattern("*.xcodeproj", "*.xcworkspace")(filename)
              or util.root_pattern("Package.swift")(filename)
              or util.find_git_ancestor(filename)
          end,
        },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        swift = { "swiftformat" },
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    config = function()
      require("lint").linters_by_ft = {
        swift = { "swiftlint" },
      }
    end,
  },
}
