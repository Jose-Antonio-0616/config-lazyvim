local M = {}

M.state = {
  name = "default",
  type = "basic",
  windows = 1,
  terminals = {},
  terminal_commands = {},
  last_files = {},
  timestamp = 0
}

function M.get_statusline()
  local layout_type = M.state.type or "basic"
  local windows_count = vim.fn.winnr("$")
  
  local layout_icons = {
    dev = "🔧",
    basic = "⚡",
    custom = "🎨"
  }
  
  local icon = layout_icons[layout_type] or "📋"
  
  if windows_count > 1 then
    return string.format("%s %s(%dw)", icon, layout_type, windows_count)
  else
    return string.format("%s %s", icon, layout_type)
  end
end

function M.create_dev_layout()
  vim.cmd("only")
  vim.cmd("wincmd h")
  vim.cmd("vsplit")
  vim.cmd("split")
  vim.api.nvim_create_user_command("LiveServer", function()
  print("🚀 Starting Live Server...")
  vim.fn.jobstart("live-server --open=" .. vim.fn.expand("%"))
end, {})

vim.api.nvim_create_user_command("LiveServerStop", function()
  vim.fn.system("pkill -f live-server")
  print("🛑 Live Server stopped.")
end, {}) 
  -- Adjust window proportions
  vim.cmd("wincmd h")
  local total_width = vim.fn.winwidth(0) + vim.fn.winwidth(vim.fn.winnr("l"))
  vim.cmd("vertical resize " .. math.floor(total_width / 2))
  
  vim.cmd("wincmd l")
  local right_pane_height = vim.fn.winheight(0) + vim.fn.winheight(vim.fn.winnr("j"))
  vim.cmd("resize " .. math.floor(right_pane_height * 0.7))
  
  vim.cmd("wincmd j")
  local term_width = vim.fn.winwidth(0) + vim.fn.winwidth(vim.fn.winnr("l"))
  vim.cmd("vertical resize " .. math.floor(term_width / 2))
  
  M.state.name = "dev_layout"
  M.state.type = "dev"
  M.state.terminals = { term1 = dev_terminal_1, term2 = dev_terminal_2 }
  M.state.timestamp = os.time()
  
  vim.cmd("wincmd h")
  vim.cmd("stopinsert")
  print("🔧 Dev Layout created: code (left) + secondary (top right) + 2 terminals (bottom right)")
end

function M.adjust_dev_layout()
  vim.cmd("wincmd h")
  local total_width = vim.fn.winwidth(0) + vim.fn.winwidth(vim.fn.winnr("l"))
  vim.cmd("vertical resize " .. math.floor(total_width / 2))
  
  vim.cmd("wincmd l")
  local right_pane_height = vim.fn.winheight(0) + vim.fn.winheight(vim.fn.winnr("j"))
  vim.cmd("resize " .. math.floor(right_pane_height * 0.7))
  
  vim.cmd("wincmd j")
  local term_width = vim.fn.winwidth(0) + vim.fn.winwidth(vim.fn.winnr("l"))
  vim.cmd("vertical resize " .. math.floor(term_width / 2))
  
  vim.cmd("wincmd h")
  vim.cmd("stopinsert")
end

M.custom_layout_step = 0
M.custom_layout_active = false
M.custom_terminals = {}

function M.start_custom_layout()
  vim.cmd("only")
  M.custom_layout_step = 0
  M.custom_terminals = {}
  M.custom_layout_active = true
  print("🎨 Custom Layout started. Use <leader>ln for next step")
end

function M.next_layout_step()
  if not M.custom_layout_active then
    print("⚠️  Start a custom layout first with <leader>lc")
    return
  end
  M.custom_layout_step = M.custom_layout_step + 1
  print("📐 Step " .. M.custom_layout_step .. " - h (split h), v (split v), t (term), e (edit), r (resize), d (done)")
end

function M.custom_split_horizontal()
  if not M.custom_layout_active then M.start_custom_layout() end
  vim.cmd("split")
end

function M.custom_split_vertical()
  if not M.custom_layout_active then M.start_custom_layout() end
  vim.cmd("vsplit")
end

function M.custom_terminal()
  if not M.custom_layout_active then M.start_custom_layout() end
  vim.cmd("terminal")
  local terminal_id = "custom_" .. vim.fn.winnr()
  M.custom_terminals[terminal_id] = vim.fn.bufnr("%")
end

function M.custom_editor()
  if not M.custom_layout_active then M.start_custom_layout() end
  if vim.fn.argc() > 0 then
    vim.cmd("edit")
  else
    vim.cmd("enew")
  end
end

function M.custom_resize()
  local choice = vim.fn.input("Resize (w)idth, (h)eight, or (c)ancel: ")
  if choice == "w" then
    local width = vim.fn.input("Width: ")
    if width ~= "" then vim.cmd("vertical resize " .. width) end
  elseif choice == "h" then
    local height = vim.fn.input("Height: ")
    if height ~= "" then vim.cmd("resize " .. height) end
  end
end

function M.finish_custom_layout()
  M.custom_layout_active = false
  M.custom_layout_step = 0
  M.state.type = "custom"
  print("✅ Custom Layout completed!")
end

function M.close_all_layout_windows()
  vim.cmd("only")
  M.state.type = "basic"
end

return M
