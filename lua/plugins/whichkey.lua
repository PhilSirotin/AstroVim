return {
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>x", group = "Xcode & IDE" },
        { "<leader>xd", group = "Debug" },
      },
    },
  },

  {
    "AstroNvim/astrocore",
    opts = {
      autocmds = {
        open_ide_layout = {
          {
            event = "VimEnter",
            callback = function()
              vim.defer_fn(function()
                vim.cmd("Neotree show")
              end, 100)
            end,
          },
        },
        open_aerial = {
          {
            event = "BufReadPost",
            pattern = "*.swift",
            callback = function()
              vim.defer_fn(function()
                vim.cmd("AerialOpen")
              end, 500)
            end,
          },
        },
      },
    },
  },
}
