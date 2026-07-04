return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Configurar pyright para que siempre lea el entorno virtual (VIRTUAL_ENV)
        pyright = {
          before_init = function(_, config)
            local python_path
            if vim.env.VIRTUAL_ENV then
              python_path = vim.env.VIRTUAL_ENV .. "/bin/python"
            else
              local venv_path = vim.fn.getcwd() .. "/.venv/bin/python"
              local myenv_path = vim.fn.getcwd() .. "/myenv/bin/python"
              if vim.fn.executable(venv_path) == 1 then
                python_path = venv_path
              elseif vim.fn.executable(myenv_path) == 1 then
                python_path = myenv_path
              else
                python_path = vim.fn.exepath("python3") or vim.fn.exepath("python")
              end
            end
            config.settings = config.settings or {}
            config.settings.python = config.settings.python or {}
            config.settings.python.pythonPath = python_path
          end,
        },
        basedpyright = {
          before_init = function(_, config)
            local python_path
            if vim.env.VIRTUAL_ENV then
              python_path = vim.env.VIRTUAL_ENV .. "/bin/python"
            else
              local venv_path = vim.fn.getcwd() .. "/.venv/bin/python"
              local myenv_path = vim.fn.getcwd() .. "/myenv/bin/python"
              if vim.fn.executable(venv_path) == 1 then
                python_path = venv_path
              elseif vim.fn.executable(myenv_path) == 1 then
                python_path = myenv_path
              else
                python_path = vim.fn.exepath("python3") or vim.fn.exepath("python")
              end
            end
            config.settings = config.settings or {}
            config.settings.python = config.settings.python or {}
            config.settings.python.pythonPath = python_path
          end,
        },
      },
    },
  },
}
