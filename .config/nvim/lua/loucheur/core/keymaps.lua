vim.keymap.set("n", "<C-S>", "<CMD>w<CR>", { silent = true, desc = "Save file" })

-- Clear search with <esc>
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch", silent = true })

-- WINDOWS MANAGEMENT
-- Move to window
-- vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", silent = true })
-- vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", silent = true })
-- vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", silent = true })
-- vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", silent = true })

-- Resize window
vim.keymap.set("n", "<S-Up>", "<CMD>resize +2<CR>", { desc = "Increase window height", silent = true })
vim.keymap.set("n", "<S-Down>", "<CMD>resize -2<CR>", { desc = "Decrease window height", silent = true })
vim.keymap.set("n", "<S-Left>", "<CMD>vertical resize -2<CR>", { desc = "Decrease window width", silent = true })
vim.keymap.set("n", "<S-Right>", "<CMD>vertical resize +2<CR>", { desc = "Increase window width", silent = true })

-- Others
vim.keymap.set("n", "<leader>ww", "<C-W>p", { desc = "Other window", silent = true })
vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete window", silent = true })
vim.keymap.set("n", "<leader>w-", "<C-W>s", { desc = "Split window below", silent = true })
vim.keymap.set("n", "<leader>w|", "<C-W>v", { desc = "Split window right", silent = true })
vim.keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split window below", silent = true })
vim.keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split window right", silent = true })
-- END WINDOWS MANAGEMENT

vim.keymap.set('n', '<leader>L', '<Cmd>lua require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/loucheur/plugins/snippets/"})<CR>')


vim.api.nvim_set_keymap('n','<leader>r','<Plug>SlimeParagraphSend',{noremap = false, silent = true})


-- vim.keymap.set('n',"<leader>rl","<Cmd>SlimeSend<CR>")





--  TMUX NAVIGATOR




local ls = require("luasnip")

vim.keymap.set({"i","s"}, "<C-l>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end)

vim.keymap.set({"i","s"}, "<C-h>", function()
    if ls.choice_active() then
        ls.change_choice(-1)
    end
end)
