return {
  {
    "lervag/vimtex",
    lazy = false, -- VimTeX no debe cargarse de forma "perezosa" o rompe Zathura y el compilador
    init = function()
      -- Desactivar el chequeo de versión estricto de VimTeX
      vim.g.vimtex_version_check = 0
      
      -- Variables globales para Vimtex traducidas desde vimscript
      vim.g.tex_flavor = "latex"
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_quickfix_mode = 0

      -- Desactivar el autoformateo síncrono al guardar para evitar congelamientos ("LSP: timeout")
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "tex", "latex" },
        callback = function()
          vim.b.autoformat = false
        end,
      })
    end,
  }
}
