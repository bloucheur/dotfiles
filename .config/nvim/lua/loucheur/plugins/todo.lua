return {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    -- event = { "BufReadPost", "BufNewFile" },
    event = "VeryLazy",
    config = function()
        require("todo-comments").setup({
            signs = true,
            sign_priority = 8,
            keywords = {
                FIX = {
                    icon = " ", -- icon used for the sign, and in search results
                    color = "#DB4B4B", -- can be a hex color, or a named color (see below)
                    alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
                    -- signs = false, -- configure signs for some keywords individually
                },
                TODO = { icon = " ", color = "#2563EB" },
                HACK = { icon = " ", color = "#E0AF68" },
                WARN = { icon = " ", color = "#E0AF68", alt = { "WARNING", "XXX" } },
                PERF = { icon = "󰓅 ", color = "#BB9AF7", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                NOTE = { icon = " ", color = "#10B981", alt = { "INFO" } },
                TEST = { icon = "󰙨 ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
            },

            highlight = {
                comments_only = false,
                multiline = false,
            },
            colors = {
                error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
                warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
                info = { "DiagnosticInfo", "#2563EB" },
                hint = { "DiagnosticHint", "#10B981" },
                default = { "Identifier", "#7C3AED" },
                test = { "Identifier", "#FF00FF" }
            },
        })
    end,
    keys = {
        {
            "]t",
            function()
                require("todo-comments").jump_next()
            end,
            desc = "Next todo comment",
        },
        {
            "[t",
            function()
                require("todo-comments").jump_prev()
            end,
            desc = "Previous todo comment",
        },
    },
}
