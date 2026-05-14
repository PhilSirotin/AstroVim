return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<leader>jp"] = {
            function()
              vim.cmd("wall")
              local root = vim.fn.getcwd()
              vim.cmd("botright split | resize 15 | terminal cd " .. root .. " && find src -name '*.java' | xargs javac -cp src 2>&1 && java -cp src Person.Main")
              vim.cmd("startinsert")
            end,
            desc = "Java Run",
          },
        },
      },
    },
  },
}
