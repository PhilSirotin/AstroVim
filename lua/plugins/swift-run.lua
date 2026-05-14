return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<leader>xp"] = {
            function()
              vim.cmd("wall")
              vim.cmd("botright split | resize 15 | terminal swift run")
              vim.cmd("startinsert")
            end,
            desc = "Swift Run (Package)",
          },
          ["<leader>xB"] = {
            function()
              vim.cmd("wall")
              vim.cmd("botright split | resize 15 | terminal swift build")
              vim.cmd("startinsert")
            end,
            desc = "Swift Build (Package)",
          },
          ["<leader>xP"] = {
            function()
              vim.cmd("wall")
              vim.cmd("botright split | resize 15 | terminal swift test")
              vim.cmd("startinsert")
            end,
            desc = "Swift Test (Package)",
          },
          ["<leader>cO"] = {
            function()
              local pkg = vim.fn.getcwd() .. "/Package.swift"
              if vim.fn.filereadable(pkg) == 1 then
                vim.fn.system("open -a /Applications/Xcode.app '" .. pkg .. "'")
                vim.notify("Opening in Xcode...", vim.log.levels.INFO)
              else
                vim.notify("Package.swift not found", vim.log.levels.WARN)
              end
            end,
            desc = "Open Package in Xcode",
          },
          ["<leader>xC"] = {
            function()
              vim.cmd("wall")
              vim.cmd("botright split | resize 15 | terminal swift package clean")
              vim.cmd("startinsert")
            end,
            desc = "Swift Clean (Package)",
          },
        },
      },
    },
  },
}
