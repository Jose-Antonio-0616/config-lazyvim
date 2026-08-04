return {
  -- Temas
  { "paulo-granthon/hyper.nvim" },
  {
    "olimorris/onedarkpro.nvim",
    config = function()
      require("onedarkpro").setup({
          colors = {
              -- Colores de sintaxis (Onedark base)
              bg = "#000000",
              fg = "#E0E0EE",
              red = "#FF5A70",
              green = "#47FD75",
              yellow = "#FAC42F",
              orange = "#FAC42F",
              blue = "#1688F0",
              purple = "#BB8AFF",
              cyan = "#39A6FF",
              
              -- =====================================
              -- 🇯🇲 Paleta "Cyber-Rasta" (Para UI)
              -- =====================================
              cr_bg = "#000000",     -- Fondo negro carbón (Totalmente negro)
              cr_red = "#FF003C",    -- Rojo Neón vibrante
              cr_yellow = "#FFD700", -- Amarillo Dorado brillante
              cr_green = "#00FF7F",  -- Verde Esmeralda Neón
          },
          styles = {
              types = "bold",
              methods = "bold",
              functions = "bold",
              keywords = "bold",
              virtual_text = "italic",
              comments = "italic",
          },
          highlights = {
              -- Mantener colores de sintaxis del código
              ["@tag"] = { fg = "${red}", style = "bold" },
              ["@tag.attribute"] = { fg = "${yellow}" },
              ["@tag.delimiter"] = { fg = "#5C6370" },
              ["@property"] = { fg = "${cyan}" },
              ["@text.environment"] = { fg = "${purple}", style = "bold" },
              ["@function.macro"] = { fg = "${blue}" },
              ["@variable"] = { fg = "${red}" },
              ["@variable.parameter"] = { fg = "${fg}" },
              ["@variable.builtin"] = { fg = "${blue}", style = "bold" },
              ["@keyword.function"] = { fg = "${purple}", style = "bold" },
              
              -- Aplicar paleta "Cyber-Rasta" a la Interfaz Gráfica (UI)
              Normal = { bg = "${cr_bg}" },
              FloatBorder = { fg = "${cr_green}" },
              TelescopeBorder = { fg = "${cr_green}" },
              TelescopePromptBorder = { fg = "${cr_yellow}" },
              VertSplit = { fg = "${cr_green}" },
              CursorLineNr = { fg = "${cr_yellow}", style = "bold" },
              PmenuSel = { bg = "${cr_red}", fg = "#ffffff", style = "bold" },
              MatchParen = { fg = "${cr_yellow}", style = "bold", underline = true },
          },
          options = {
              bold = true,
              italic = true,
              underline = true,
              cursorline = true,
              transparency = false,
          }
      })
      vim.cmd("colorscheme onedark")
    end,
  },

  -- Django
  { "tweekmonster/django-plus.vim" },

  -- Colorizer (Reemplaza vim-css-color con la versión de lua)
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },

  -- Quarto y dependencias
  {
    "jmbuhr/otter.nvim",
    opts = { buffers = {} }
  },
  {
    "quarto-dev/quarto-nvim",
    dependencies = {
      "jmbuhr/otter.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("quarto").setup({
          lspFeatures = {
              languages = { "python", "bash", "html" },
          },
          codeRunner = {
              enabled = true,
              default_method = "iron",
              ft_runners = {
                  quarto = "iron",
                  python = "iron",
              },
              never_run = { "yaml"},
          },
      })
    end,
  },

  -- Iron REPL
  {
    "Vigemus/iron.nvim",
    config = function()
      local iron = require("iron.core")
      iron.setup({
          config = {
              scratch_repl   = true,
              repl_definition = {
                  python = {
                      command = { "python3" },
                      format = require("iron.fts.common").bracketed_paste_python,
                      block_dividers = { "#", "# %%", "#%%"},
                  },
                  quarto = {
                      command = { "ipython", "--no-autoindent" },
                      format = require("iron.fts.common").bracketed_paste_python,
                      block_dividers = {"#", "# %%", "#%%", "```", "```{python}"},
                  },
                  javascript = {
                      command = { "node" },
                      block_dividers = { "//" },
                  },
                  typescript = {
                      command = { "deno" },
                      block_dividers = { "//" }
                  }
              },
              repl_filetype = function(bufnr, ft) return ft end,
              dap_integration = true,
              repl_open_cmd = require("iron.view").split.vertical.rightbelow("%40"),
              highlight = { italic = true },
              ignore_blank_lines = true,
          },
      })
    end,
  },

  -- Sniprun
  {
    "michaelb/sniprun",
    build = "sh install.sh",
    config = function()
      require("sniprun").setup({
          display = { "Terminal" },
          display_options = {
              terminal_scrollback = vim.o.scrollback,
              terminal_line_number = false,
              terminal_signcolumn = false,
              terminal_position = 'vertical',
              terminal_width = 50,
              terminal_height = 20
          },
          selected_interpreters = {"JS_TS_deno"},
          repl_enable = { "JS_TS_deno" },
      })
    end,
  },

  -- PlatformIO / Vim-dispatch
  { "tpope/vim-dispatch" },

  -- Justfile
  { "NoahTheDuke/vim-just" },

  -- Treesitter custom ensure_installed
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "python", "html", "css", "javascript", "typescript", "lua", "vim", "vimdoc", "query", "json", "yaml", "bash", "markdown", "comment" })
      end
    end,
  },
}
