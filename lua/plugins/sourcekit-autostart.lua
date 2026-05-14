return {
  {
    "AstroNvim/astrocore",
    opts = {
      autocmds = {
        sourcekit_start = {
          {
            event = "FileType",
            pattern = "swift",
            callback = function()
              local config = require("astrolsp").config.config.sourcekit or {}
              local root = config.root_dir and config.root_dir(vim.api.nvim_buf_get_name(0))
              vim.lsp.start({
                name = "sourcekit",
                cmd = config.cmd,
                root_dir = root,
                capabilities = config.capabilities,
              })
            end,
          },
        },
      },
    },
  },
}
