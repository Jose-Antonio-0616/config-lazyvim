-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- Indentación (Python defaults, overridden by autocmds/treesitter for others)
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- Rendimiento
-- opt.lazyredraw = true
opt.ttyfast = true
opt.synmaxcol = 200

-- Folding
opt.foldmethod = "indent"
opt.foldlevelstart = 99

-- Undofile
opt.undolevels = 1000
opt.undoreload = 10000

-- Otros
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.ignorecase = true
opt.smartcase = true
opt.wrapscan = true

-- Acomodar texto largo al ancho de la pantalla (Word Wrap)
opt.wrap = true
opt.linebreak = true -- Evita cortar palabras a la mitad cuando envuelve la línea

-- No longer sourcing vimscript layouts, using pure Lua module 'config.layouts' instead.

-- Evitar que LazyVim dé "un paso atrás" hacia la raíz del proyecto (ej. carpeta .git)
-- Forzamos a que el directorio de trabajo sea exactamente donde abriste nvim (cwd)
vim.g.root_spec = { "cwd" }

-- =========================================================================
-- 🐍 Detección Global de Entornos Virtuales Python ("Zero-Activation")
-- =========================================================================
local venv_path = vim.fn.getcwd() .. "/.venv"
local myenv_path = vim.fn.getcwd() .. "/myenv"

if not vim.env.VIRTUAL_ENV then
  if vim.fn.isdirectory(venv_path) == 1 then
    vim.env.VIRTUAL_ENV = venv_path
  elseif vim.fn.isdirectory(myenv_path) == 1 then
    vim.env.VIRTUAL_ENV = myenv_path
  end
end

-- Si detectamos el entorno, lo activamos a nivel del sistema interno de Neovim
if vim.env.VIRTUAL_ENV then
  vim.env.PATH = vim.env.VIRTUAL_ENV .. "/bin:" .. vim.env.PATH
end
