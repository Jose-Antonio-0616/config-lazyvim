return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      -- Función para inyectar nuestro layout custom
      local function layout_status()
        local ok, layouts = pcall(require, "config.layouts")
        if ok and layouts.get_statusline then
          return layouts.get_statusline()
        end
        return ""
      end

      -- Agregar al inicio de lualine_x
      table.insert(opts.sections.lualine_x, 1, {
        layout_status,
        color = { fg = "#39A6FF", gui = "bold" }
      })
      
      -- Asegurar que el entorno virtual también se muestre (en lualine_y o lualine_x)
      -- LazyVim debería hacerlo, pero lo forzamos si hace falta.
      table.insert(opts.sections.lualine_x, 2, function()
        if vim.env.VIRTUAL_ENV then
          return "🐍 " .. vim.fn.fnamemodify(vim.env.VIRTUAL_ENV, ":t")
        end
        return ""
      end)
    end,
  }
}
