return {
  -- Deshabilitar las líneas de indentación de mini.indentscope (con su nombre actualizado por si está instalado)
  { "nvim-mini/mini.indentscope", enabled = false },
  
  -- Deshabilitar las líneas de indentación si se usa indent-blankline
  { "lukas-reineke/indent-blankline.nvim", enabled = false },
  
  -- Deshabilitar las líneas de indentación si la versión actual de LazyVim usa Snacks
  -- Además, deshabilitar snacks.image porque no es compatible con wave-terminal
  {
    "folke/snacks.nvim", 
    opts = { 
      indent = { enabled = false },
      image = { enabled = false },
      dashboard = {
        preset = {
          header = [[
██╗  ██╗       ██╗     ██╗ ██████╗ ███╗   ██╗ ██████╗ ██████╗ ██████╗ ███████╗
██║ ██╔╝       ██║     ██║██╔═══██╗████╗  ██║██╔════╝██╔═══██╗██╔══██╗██╔════╝
█████╔╝  █████╗██║     ██║██║   ██║██╔██╗ ██║██║     ██║   ██║██████╔╝█████╗  
██╔═██╗  ╚════╝██║     ██║██║   ██║██║╚██╗██║██║     ██║   ██║██╔══██╗██╔══╝  
██║  ██╗       ███████╗██║╚██████╔╝██║ ╚████║╚██████╗╚██████╔╝██║  ██║███████╗
╚═╝  ╚═╝       ╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝
          ]],
        },
      },
    } 
  },

  -- Personalizar la barra superior de pestañas (Bufferline) para que resalte más
  {
    "akinsho/bufferline.nvim",
    opts = function(_, opts)
      opts.options = vim.tbl_deep_extend("force", opts.options or {}, {
        always_show_bufferline = true,
      })
      opts.highlights = vim.tbl_deep_extend("force", opts.highlights or {}, {
        buffer_selected = {
          bg = "#00FF7F", -- Verde Esmeralda de la paleta Cyber-Rasta
          fg = "#0A0A0A", -- Texto oscuro para alto contraste
          bold = true,
          italic = false,
        },
        indicator_selected = {
          fg = "#00FF7F",
          bg = "#00FF7F",
        },
        separator_selected = {
          fg = "#0A0A0A",
          bg = "#00FF7F",
        },
        close_button_selected = {
          bg = "#00FF7F",
          fg = "#0A0A0A",
        },
        modified_selected = {
          bg = "#00FF7F",
          fg = "#0A0A0A", -- Todo en negro sobre verde para máxima legibilidad
        },
        -- Reparar los contrastes: texto/iconos oscuros sobre el fondo Verde Esmeralda
        error_selected = { bg = "#00FF7F", fg = "#0A0A0A", bold = true, italic = false },
        error_diagnostic_selected = { bg = "#00FF7F", fg = "#0A0A0A", bold = true },
        warning_selected = { bg = "#00FF7F", fg = "#0A0A0A", bold = true, italic = false },
        warning_diagnostic_selected = { bg = "#00FF7F", fg = "#0A0A0A", bold = true },
        info_selected = { bg = "#00FF7F", fg = "#0A0A0A", bold = true, italic = false },
        info_diagnostic_selected = { bg = "#00FF7F", fg = "#0A0A0A", bold = true },
        hint_selected = { bg = "#00FF7F", fg = "#0A0A0A", bold = true, italic = false },
        hint_diagnostic_selected = { bg = "#00FF7F", fg = "#0A0A0A", bold = true },
        diagnostic_selected = { bg = "#00FF7F", fg = "#0A0A0A", bold = true, italic = false },
      })
    end
  }
}
