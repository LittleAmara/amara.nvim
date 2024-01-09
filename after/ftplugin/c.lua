local lsp_utils = require("utils.lsp")

vim.opt.comments = [[s:/*,mb:**,ex:*/,://,:///",]]

local root_files = {
  "compile_commands.json",
  ".clang-format",
  "build",
  ".git",
}

local paths = vim.fs.find(root_files, {
  stop = vim.uv.os_homedir(),
  upward = true,
})

lsp_utils.setup_lsp({
  name = "clangd",
  cmd = { "clangd" },
  filetypes = { "c", "cpp" },
  root_dir = vim.fs.dirname(paths[1]),
  settings = {
    clangd = {
      formatting = {
        command = { "clang-format --style=file" },
      },
    },
  },
})
