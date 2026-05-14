return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha",
    },
  },
  {
    "AstroNvim/astroui",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "AstroNvim/astrocore",
    opts = {
      autocmds = {
        black_background = {
          {
            event = "ColorScheme",
            callback = function()
              vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
              vim.api.nvim_set_hl(0, "NormalNC", { bg = "#000000" })
              vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })
              vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "#000000" })
              vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "#000000" })
              vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = "#000000" })
              vim.api.nvim_set_hl(0, "AerialNormal", { bg = "#000000" })
              vim.api.nvim_set_hl(0, "SignColumn", { bg = "#000000" })
              vim.api.nvim_set_hl(0, "LineNr", { bg = "#000000" })
            end,
          },
        },
      },
    },
  },
}
