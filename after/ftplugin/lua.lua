local lsp_utils = require("utils.lsp")

vim.opt.shiftwidth = 2

local root_files = { ".git" }

local paths = vim.fs.find(root_files, {
  stop = vim.uv.os_homedir(),
  upward = true,
  path = vim.fs.dirname(vim.api.nvim_buf_get_name(0)),
})

lsp_utils.setup_lsp({
  name = "lua-language-server",
  cmd = { "lua-language-server" },
  before_init = require("neodev.lsp").before_init,
  root_dir = vim.fs.dirname(paths[1]),
  settings = {
    Lua = {
      format = {
        enable = true,
        defaultConfig = {
          indent_style = "space",
          indent_size = "2",
        },
      },
    },
  },
})
