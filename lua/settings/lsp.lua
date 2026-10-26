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
  root_markers = { ".git", ".env" },
})

vim.lsp.config.luals = {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
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

-- Disabled
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

vim.lsp.config.intelephense = {
  cmd = { "intelephense", "--stdio" },
  root_markers = { "composer.json", ".phpactor.json", ".phpactor.yml", ".phpactor.yaml" },
  filetypes = { "php", "blade" },
  settings = {
    intelephense = {
      files = {
        associations = {
          '*.php', '*.blade.php'
        }
      }
    }
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

vim.lsp.config.emmet = {
  cmd = { "emmet-language-server", "--stdio" },
  filetypes = { "html", "blade", "php" },
}

vim.lsp.config.svelte = {
  cmd = { "svelteserver", "--stdio" },
  root_markers = { "package-lock.json", "yarn.lock", "pnpm-lock.yaml", "bun.lockb", "bun.lock" },
  filetypes = { "svelte" },
}

vim.lsp.config.tofu_ls = {
  cmd = { "tofu-ls", "serve" },
  filetypes = { "terraform", "tf" }
}

vim.lsp.config.vts_ls = {
  cmd = { "vtsls", "--stdio" },
  filetypes = { "typescript", "javascript", "typescriptreact" },
  root_markers = { "package-lock.json", "yarn.lock", "pnpm-lock.yaml", "bun.lockb", "bun.lock" },
}

vim.lsp.config.ansible_ls = {
  cmd = { 'ansible-language-server', '--stdio' },
  settings = {
    ansible = {
      python = {
        interpreterPath = 'python',
      },
      ansible = {
        path = 'ansible',
      },
      executionEnvironment = {
        enabled = false,
      },
      validation = {
        enabled = true,
        lint = {
          enabled = true,
          path = 'ansible-lint',
        },
      },
    },
  },
  filetypes = { 'yaml' },
  root_dir = function(bufnr, on_dir)
    local root = vim.fs.root(bufnr, { 'ansible.cfg', '.ansible-lint' })
    if root ~= nil then
      on_dir(root)
    end
  end,
}

vim.lsp.enable({ "luals", "clangd", "gopls", "templ_lsp", "intelephense", "pylsp", "rust_analyzer", "emmet", "svelte",
  "ts_ls", "vts_ls", "tofu_ls", "ansible_ls" })
