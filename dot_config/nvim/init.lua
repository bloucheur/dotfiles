local opts = require("nvim-opts")
opts.init()

vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")


local keys = require("nvim-keys")
keys.init()

local autocmds = require("nvim-autocmds")
autocmds.init()

require'lspconfig'.julials.setup{
  on_new_config = function(new_config, _)
      local julia = vim.fn.expand("~/.julia/environments/nvim-lspconfig/bin/julia")
      if require'lspconfig'.util.path.is_file(julia) then
          new_config.cmd[1] = julia
      end
  end
}