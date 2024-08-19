local lsp_utils = require("utils.lsp")

local root_files = { "go.work", "go.mod", ".git" }

local paths = vim.fs.find(root_files, {
  stop = vim.uv.os_homedir(),
  upward = true,
  path = vim.fs.dirname(vim.api.nvim_buf_get_name(0)),
})

lsp_utils.setup_lsp({
  name = "templ lsp",
  cmd = { "templ", "lsp" },
  root_dir = vim.fs.dirname(paths[1]),
  filetypes = { "templ" },
  single_file_support = true,
  settings = {},
})
