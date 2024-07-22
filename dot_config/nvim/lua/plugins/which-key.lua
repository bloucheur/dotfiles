return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      local wk = require("which-key")
      wk.add({
        { "<leader>l", group = "LSP" },
        { "<leader>f", group = "Filetree" },
        { "<leader>m", group = "Format or Linting" },
        { "<leader>r", group = "Rename" },
        { "<leader>s", group = "Search" },
        { "<leader>t", group = "Tabs" },
        { "<leader>u", group = "Buffers" },
        { "<leader>w", group = "Wins" },
      })
    end,
    config = true,
  }