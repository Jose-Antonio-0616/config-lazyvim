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
      image = { enabled = false }
    } 
  }
}
