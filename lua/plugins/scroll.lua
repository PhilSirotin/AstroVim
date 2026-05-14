return {
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup({
        duration_multiplier = 3.0,
      })
      local neoscroll = require("neoscroll")
      vim.keymap.set({ "n", "v" }, "<ScrollWheelUp>", function()
        neoscroll.scroll(-3, { duration = 150 })
      end)
      vim.keymap.set({ "n", "v" }, "<ScrollWheelDown>", function()
        neoscroll.scroll(3, { duration = 150 })
      end)
    end,
  },
}
