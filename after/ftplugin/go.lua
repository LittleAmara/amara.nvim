vim.opt.expandtab = false

local lsp_utils = require("utils.lsp")

local root_files = { "go.work", "go.mod", ".git" }

local paths = vim.fs.find(root_files, {
  stop = vim.uv.os_homedir(),
  upward = true,
  path = vim.fs.dirname(vim.api.nvim_buf_get_name(0)),
})

lsp_utils.setup_lsp({
  name = "gopls",
  cmd = { "gopls" },
  root_dir = vim.fs.dirname(paths[1]),
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  single_file_support = true,
  settings = {
    gopls = {
      hints = {
        -- assignVariableTypes = true,
        -- compositeLiteralFields = true,
        -- compositeLiteralTypes = true,
        -- constantValues = true,
        -- rangeVariableTypes = true,
        functionTypeParameters = true,
        parameterNames = true,
      },
      semanticTokens = true,
    },
  },
})
