-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- attach ansible lsp on ansible-like files
vim.cmd([[
  au BufRead *.yaml,*.yml if search('hosts:\|tasks:', 'nw') | set ft=yaml.ansible | endif
  au BufRead,BufNewFile */roles/*.yaml set filetype=yaml.ansible
  au BufRead,BufNewFile */playbooks/*.yaml set filetype=yaml.ansible
]])

vim.cmd([[
  augroup VaultFiletypeDetection
    autocmd!
    autocmd BufReadPost *.yaml.vault,*.yml.vault if !search('ANSIBLE_VAULT', 'nw') | set filetype=yaml | endif
  augroup END
]])
