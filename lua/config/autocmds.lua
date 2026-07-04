-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local function augroup(name)
  return vim.api.nvim_create_augroup("user_" .. name, { clear = true })
end

-- Web development spaces
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("web_spaces"),
  pattern = { "html", "css", "scss", "sass", "less", "javascript", "typescript", "json", "yaml", "yml", "xml", "htmldjango" },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
  end,
})

-- Python spaces
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("python_spaces"),
  pattern = "python",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.textwidth = 88
    vim.opt_local.foldmethod = "indent"
  end,
})

-- Makefiles
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("make_tabs"),
  pattern = "make",
  callback = function()
    vim.opt_local.expandtab = false
  end,
})
