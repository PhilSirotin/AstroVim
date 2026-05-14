return {
  {
    "AstroNvim/astrocore",
    opts = {
      autocmds = {
        jdtls_start = {
          {
            event = "FileType",
            pattern = "java",
            callback = function()
              local root = vim.fs.root(0, { "pom.xml", "build.gradle", ".git", "src" })
              vim.lsp.start({
                name = "jdtls",
                cmd = { vim.fn.stdpath("data") .. "/mason/bin/jdtls" },
                root_dir = root or vim.fn.getcwd(),
              })
            end,
          },
        },
      },
    },
  },
}
