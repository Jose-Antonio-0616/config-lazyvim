return {
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      if not opts.spec then opts.spec = {} end
      
      -- Agregar nombres y descripciones a los grupos del menú desplegable para que se vea bien
      table.insert(opts.spec, {
        { "<leader>m", group = "PlatformIO", icon = "🚀" },
        { "<leader>y", group = "MicroPython", icon = "🐍" },
        { "<leader>r", group = "Execute (Run/Iron)", icon = "▶️" },
        { "<leader>p", group = "Quarto", icon = "📊" },
        { "<leader>v", group = "LaTeX", icon = "📝" },
        { "<leader>l", group = "Layouts", icon = "🎨" },
        { "<leader>n", group = "LiveServer", icon = "🌐" },
      })
    end,
  }
}
