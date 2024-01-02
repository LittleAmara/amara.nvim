local lsp_utils = require("utils.lsp")

vim.opt.shiftwidth = 2

lsp_utils.setup_lsp({
  name = "lua-language-server",
  cmd = { "lua-language-server" },
  before_init = require("neodev.lsp").before_init,
  root_dir = vim.fn.getcwd(),
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
