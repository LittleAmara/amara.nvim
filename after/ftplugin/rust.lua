local lsp_utils = require("utils.lsp")

vim.opt.makeprg = "cargo build"

local root_files = { "Cargo.toml", ".git" }

local paths = vim.fs.find(root_files, {
  stop = vim.uv.os_homedir(),
  upward = true,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.experimental = {
  serverStatusNotification = true,
}

lsp_utils.setup_lsp({
  name = "rust-analyzer",
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_dir = vim.fs.dirname(paths[1]),
  capabilities = capabilities,
})
