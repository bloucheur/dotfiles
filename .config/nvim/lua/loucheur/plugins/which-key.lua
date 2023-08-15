local mappings = {
    -- ["p"] = {"<cmd> NvimTreeToggle <CR>", "Explorer"},
    -- ["m"] = {
    --     name = " ", " TEST",
    --     e = {"<cmd> NvimTreeToggle <CR>", "test explore"}

    -- }
    ["g"] = {
        name = "Git",
        g = {"<cmd>lua require 'loucheur.plugins.toggleterm'.lazygit_toggle()<cr>", "Lazygit" }, -- TODO MANIP A REVOIR
    }
}


return {
    "folke/which-key.nvim",
    enabled = true,
    config = function()
        local wk = require("which-key")

        wk.setup({
            icons = {
                breadcrumb = "»",
                separator = "➜",
                group = "+",
            }
        })

        local opts = {
            mode = "n", -- NORMAL mode
            prefix = "<leader>",
            buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
            silent = true, -- use `silent` when creating keymaps
            noremap = true, -- use `noremap` when creating keymaps
            nowait = true, -- use `nowait` when creating keymaps
          }

        wk.register(mappings, opts)
    end,
}