local lsp_utils = require("utils.lsp")

local root_files = { "composer.json", ".phpactor.json", ".git", ".phpactor.yml" }

local paths = vim.fs.find(root_files, {
  stop = vim.uv.os_homedir(),
  upward = true,
  path = vim.fs.dirname(vim.api.nvim_buf_get_name(0)),
})

lsp_utils.setup_lsp({
  name = "php lsp",
  cmd = { "phpactor", "language-server" },
  root_dir = vim.fs.dirname(paths[1]),
  filetypes = { "php", "blade" },
  init_options = {
    ['language_server_php_cs_fixer.enabled'] = true,
  },
})
