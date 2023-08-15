return {
    "jesseduffield/lazygit",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    keys = {
        {"<leader>gg", "<Cmd>LazyGit<CR>", desc="Open LazyGit"},
    },
}