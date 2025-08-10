-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.cmdheight = 2
vim.o.showcmdloc = "statusline"
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
vim.opt.swapfile = false
-- code folding settings
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 99
vim.opt.foldnestmax = 10 -- deepest fold is 10 levels
vim.opt.foldenable = false -- don't fold by default
vim.opt.foldlevel = 1

vim.opt.showmode = false

vim.g.lazyvim_picker = "fzf"

-- custom filetypes for the lsp
vim.filetype.add({
  extension = { bats = "sh", jinja = "jinja", jinja2 = "jinja", j2 = "jinja" },
})
