local opt = vim.opt

function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.api.nvim_create_user_command(
  'LatexFormat',
  "terminal latexindent -w -s main.tex",
  {bang = true, desc = "Open init.lua Neovim config"}
)

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

vim.opt.updatetime = 200




vim.bo.expandtab = true
vim.bo.shiftwidth = 4
vim.bo.tabstop = 4
vim.bo.softtabstop = 4


vim.g.mapleader = " "


vim.opt.backup = false          -- Create a backup file
vim.opt.cmdheight = 1
vim.opt.conceallevel = 0        -- So `` is visible in markdown files
vim.opt.fileencoding = "utf-8"  -- Base encoding
vim.opt.foldmethod = "manual"
vim.opt.hidden = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.title = true
-- vim.opt.undofile = true


vim.opt.expandtab = true

vim.opt.wrap = false

vim.opt.pumheight = 10

vim.opt.showmode = false

vim.opt.updatetime = 100

vim.opt.swapfile = false
vim.opt.number = true
vim.opt.showcmd = false
vim.opt.ruler = false
vim.opt.laststatus = 3


vim.g.loaded_netrwPlugin = 0

vim.g.slime_target = "tmux"
-- vim.g.slime_paste_file = "$HOME/.slime_paste"
vim.cmd([[let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}]])

local M = {}
M.lazygit_toggle = function()
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new {
      cmd = "lazygit",
      hidden = true,
      direction = "float",
      float_opts = {
        border = "none",
        width = 100000,
        height = 100000,
      },
      on_open = function(_)
        vim.cmd "startinsert!"
      end,
      on_close = function(_) end,
      count = 99,
    }
    lazygit:toggle()
  end
  



  local default_diagnostic_config = {
    signs = {
      active = true,
      values = {
        { name = "DiagnosticSignError", text = icons.diagnostics.Error },
        { name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
        { name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
        { name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
      },
    },
    virtual_text = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(default_diagnostic_config)