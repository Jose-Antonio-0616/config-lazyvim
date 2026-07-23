-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Basic maps
-- Guardado nativo de LazyVim: <C-s>
-- Menú de ventanas nativo de LazyVim: <leader>w
map("n", "<C-a>", "ggVG", { desc = "Select all" })
map("i", "<C-a>", "<Esc>ggVG", { desc = "Select all" })
map("v", "<C-a>", "<Esc>ggVG", { desc = "Select all" })

-- Buffers
map("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })

-- Telescope (Replacing FZF)
map("n", "<leader>fg", "<cmd>Telescope git_files<CR>", { desc = "Git Files" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Buffers" })
map("n", "<leader>fl", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Fuzzy find lines" })
map("n", "<leader>ft", "<cmd>Telescope help_tags<CR>", { desc = "Help tags" })
map("n", "<C-p>", "<cmd>Telescope find_files<CR>", { desc = "Find files" })

-- Git
map("n", "<leader>gn", "<cmd>Gitsigns next_hunk<cr>", { desc = "Next Hunk" })
map("n", "<leader>gp", "<cmd>Gitsigns prev_hunk<cr>", { desc = "Prev Hunk" })
map("n", "<leader>gh", "<cmd>Gitsigns stage_hunk<cr>", { desc = "Stage Hunk" })
map("n", "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>", { desc = "Undo Stage Hunk" })

-- Search and replace (Moved to <leader>R to avoid breaking Telescope on <leader>s)
map("n", "<leader>R", ":%s//gc", { desc = "Search and replace" })

-- Clear search highlight (LazyVim uses <Esc> by default, removed <leader>c to not break Code actions)

-- Terminal
map("n", "<leader>te", ":terminal<CR>", { desc = "Open Terminal" })

-- Line numbers
map("n", "<leader>tn", ":set number!<CR>", { desc = "Toggle line numbers" })
map("n", "<leader>tr", ":set relativenumber!<CR>", { desc = "Toggle relative line numbers" })

-- Which-key
map("n", "<leader>?", "<cmd>WhichKey<CR>", { desc = "Which-key map" })

-- Quarto
map("n", "<leader>pp", "<Cmd>QuartoPreview<CR>", { desc = "Quarto Preview" })
map("n", "<leader>ps", "<Cmd>QuartoClosePreview<CR>", { desc = "Quarto Close Preview" })
map("n", "<leader>pr", "<Cmd>QuartoRender<CR>", { desc = "Quarto Render" })

-- Iron REPL
map("n", "<leader>rr", function()
  if vim.bo.filetype == "python" then
    vim.ui.select({ "ipython", "python3" }, { prompt = "🐍 Elige el REPL para Python:" }, function(choice)
      if not choice then return end
      local config = require("iron.config")
      if config.repl_definition and config.repl_definition.python then
        config.repl_definition.python.command = { choice }
      end
      vim.cmd("IronRepl")
    end)
  else
    vim.cmd("IronRepl")
  end
end, { desc = "Iron REPL (Interactivo)" })
map("n", "<leader>rl", "<Cmd>lua require('iron.core').send_line()<CR>", { desc = "Iron Send Line" })
map("v", "<leader>ri", "<Cmd>lua require('iron.core').visual_send()<CR>", { desc = "Iron Visual Send" })
map("n", "<leader>rb", "<Cmd>lua require('iron.core').send_code_block()<CR>", { desc = "Iron Send Code Block" })
map("n", "<leader>rk", "<Cmd>lua require('iron.core').send(nil, string.char(12))<CR>", { desc = "Iron Clear REPL" })
map("n", "<leader>rR", "<cmd>IronRestart<CR>", { desc = "Iron Restart" })
map("n", "<leader>rq", "<Cmd>lua require('iron.core').close_repl()<CR>", { desc = "Iron Close REPL" })

-- Sniprun
map("n", "<leader>rf", ":%SnipRun<CR>", { desc = "SnipRun File" })
map("v", "<leader>rs", ":SnipRun<CR>", { desc = "SnipRun Visual" })
map("n", "<leader>rs", ":SnipRun<CR>", { desc = "SnipRun Line" })
map("n", "<leader>rc", ":SnipClose<CR>", { desc = "SnipRun Close" })

-- VimTex (Changed prefix from <leader>x to <leader>v to avoid breaking Trouble/Diagnostics)
map("n", "<leader>vc", "<cmd>VimtexCompile<CR>", { desc = "Vimtex Compile" })
map("n", "<leader>vv", "<cmd>VimtexView<CR>", { desc = "Vimtex View" })
map("n", "<leader>ve", "<cmd>VimtexErrors<CR>", { desc = "Vimtex Errors" })
map("n", "<leader>vk", "<cmd>VimtexStop<CR>", { desc = "Vimtex Stop" })
map("n", "<leader>vl", "<cmd>VimtexClean<CR>", { desc = "Vimtex Clean" })
map("n", "<leader>vt", "<cmd>VimtexTocToggle<CR>", { desc = "Vimtex TOC Toggle" })
map("n", "<leader>vi", "<cmd>VimtexInfo<CR>", { desc = "Vimtex Info" })

-- PlatformIO
map("n", "<leader>mi", "<cmd>PioInitDB<CR>", { desc = "Pio Init DB" })
map("n", "<leader>mb", "<cmd>PioBuild<CR>", { desc = "Pio Build" })
map("n", "<leader>mu", "<cmd>PioUpload<CR>", { desc = "Pio Upload" })
map("n", "<leader>mm", "<cmd>PioMonitor<CR>", { desc = "Pio Monitor" })

-- MicroPython (Changed prefix from <leader>u to <leader>y to avoid breaking UI toggles)
map("n", "<leader>yr", "<cmd>MpRun<CR>", { desc = "Mp Run" })
map("n", "<leader>yu", "<cmd>MpUpload<CR>", { desc = "Mp Upload" })
map("n", "<leader>yp", "<cmd>MpRepl<CR>", { desc = "Mp REPL" })
map("n", "<leader>yl", "<cmd>MpLs<CR>", { desc = "Mp LS" })

-- Layouts personalizados (migrados a config/layouts.lua)
map("n", "<leader>ld", "<cmd>lua require('config.layouts').create_dev_layout()<CR>", { desc = "Dev Layout" })
map("n", "<leader>la", "<cmd>lua require('config.layouts').adjust_dev_layout()<CR>", { desc = "Adjust Dev Layout" })
map("n", "<leader>lc", "<cmd>lua require('config.layouts').start_custom_layout()<CR>", { desc = "Create Custom Layout" })
map("n", "<leader>ln", "<cmd>lua require('config.layouts').next_layout_step()<CR>", { desc = "Next Layout Step" })
map("n", "<leader>lh", "<cmd>lua require('config.layouts').custom_split_horizontal()<CR>", { desc = "Layout: Split H" })
map("n", "<leader>lv", "<cmd>lua require('config.layouts').custom_split_vertical()<CR>", { desc = "Layout: Split V" })
map("n", "<leader>lt", "<cmd>lua require('config.layouts').custom_terminal()<CR>", { desc = "Layout: Terminal" })
map("n", "<leader>le", "<cmd>lua require('config.layouts').custom_editor()<CR>", { desc = "Layout: Editor" })
map("n", "<leader>lr", "<cmd>lua require('config.layouts').custom_resize()<CR>", { desc = "Layout: Resize" })
map("n", "<leader>lD", "<cmd>lua require('config.layouts').finish_custom_layout()<CR>", { desc = "Layout: Finish" })
map("n", "<leader>lX", "<cmd>lua require('config.layouts').close_all_layout_windows()<CR>", { desc = "Layout: Close All" })

-- ============ Comandos de Usuario (PlatformIO, MicroPython, LiveServer) ============
vim.api.nvim_create_user_command("PioInitDB", "!pio run -t compiledb", {})
vim.api.nvim_create_user_command("PioBuild", "Dispatch pio run", {})
vim.api.nvim_create_user_command("PioUpload", "Dispatch pio run -t upload", {})
vim.api.nvim_create_user_command("PioMonitor", "vsplit | resize 15 | term pio device monitor", {})
vim.api.nvim_create_user_command("PioClean", "Dispatch pio run -t clean", {})

vim.api.nvim_create_user_command("MpRun", "Dispatch uv run mpremote run %", {})
vim.api.nvim_create_user_command("MpUpload", "Dispatch uv run mpremote cp % :%:t", {})
vim.api.nvim_create_user_command("MpRepl", "vsplit | resize 15 | term uv run mpremote repl", {})
vim.api.nvim_create_user_command("MpLs", "!uv run mpremote ls", {})
vim.api.nvim_create_user_command("MpReset", "Dispatch uv run mpremote soft-reset", {})
vim.api.nvim_create_user_command("MpInstall", function(opts)
  vim.cmd("vsplit | term uv run mpremote mip install " .. opts.args)
end, { nargs = 1 })

vim.api.nvim_create_user_command("LiveServer", function()
  print("🚀 Iniciando Live Server...")
  vim.fn.jobstart("live-server --open=" .. vim.fn.expand("%"))
end, {})

vim.api.nvim_create_user_command("LiveServerStop", function()
  vim.fn.system("pkill -f live-server")
  print("🛑 Servidor detenido.")
end, {})
