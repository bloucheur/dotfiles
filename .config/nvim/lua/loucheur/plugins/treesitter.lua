return {
    "nvim-treesitter/nvim-treesitter",
    enabled = true,
    config = function()
        local ts = require("nvim-treesitter.configs")

        ts.setup({
            enable = true,
            ensure_installed = {
                "julia",
                "latex",
                -- "python",
                -- "r",
                -- "matlab"
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            -- highlight = {enable = true},
            -- indent = {enable = true},
            -- autotag = {enable = true},
        })
    end,
}