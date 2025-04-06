-- General settings
vim.diagnostic.config({
  virtual_text = true,
  float = { border = vim.o.winborder },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "✘",
      [vim.diagnostic.severity.WARN] = "▲",
      [vim.diagnostic.severity.HINT] = "⚑",
      [vim.diagnostic.severity.INFO] = "»",
    },
  },
})


-- Servers settings
vim.lsp.config("*", {
  root_markers = { ".git" },
})

vim.lsp.config.luals = {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".git" },
  settings = {
    Lua = {
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      format = {
        enable = true,
        defaultConfig = {
          indent_style = "space",
          indent_size = "2",
        },
      },
    },
  },
}

vim.lsp.config.clangd = {
  cmd = { "clangd" },
  filetypes = { "c", "cpp" },
  root_markers = { "compile_commands.json", ".clang-format", "build", },
  settings = {
    clangd = {
      formatting = {
        command = { "clang-format --style=file" },
      },
    },
  },
}

vim.lsp.config.gopls = {
  cmd = { "gopls" },
  filetypes = { "go" },
  root_markers = { "go.work", "go.mod", "gotmpl" },
  settings = {
    gopls = {
      hints = {
        functionTypeParameters = true,
        parameterNames = true,
      },
      semanticTokens = true,
    },
  },
}

vim.lsp.config.templ_lsp = {
  cmd = { "templ", "lsp" },
  root_markers = { "go.work", "go.mod" },
  filetypes = { "templ" },
}

vim.lsp.config.nills = {
  cmd = { "nil" },
  filetypes = { "nix" },
  root_markers = { "flake.nix" },
  settings = {
    ["nil"] = {
      formatting = { command = { "nixpkgs-fmt" } },
      nix = {
        flake = {
          autoArchive = false,    -- I don't need this until the autoEvalInputs in fixed
          autoEvalInputs = false, -- Nil doesn't handle well some inputs for the moment
        },
      },
    },
  },
}

vim.lsp.config.phpactor = {
  cmd = { "phpactor", "language-server" },
  root_markers = { "composer.json", ".phpactor.json", ".phpactor.yml", ".phpactor.yaml" },
  filetypes = { "php", "blade" },
  init_options = {
    ['language_server_php_cs_fixer.enabled'] = true,
    ['language_server_phpstan.enabled'] = true,
    ['language_server_psalm.enabled'] = true,
  },
}

vim.lsp.config.pylsp = {
  cmd = { "pylsp" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", "pyrightconfig.json", },
  settings = {
    pylsp = {
      plugins = {
        ruff = {
          enabled = true,
          formatEnabled = true,
        },
      }
    }
  },
}

vim.lsp.config.rust_analyzer = {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_markers = { "Cargo.toml" },
}

vim.lsp.enable({ "luals", "clangd", "gopls", "templ_lsp", "phpactor", "pylsp", "rust_analyzer" })
