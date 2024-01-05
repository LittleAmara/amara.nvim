local lsp_utils = require("utils.lsp")

vim.opt.shiftwidth = 2

local root_files = { "flake.nix", ".git" }

local paths = vim.fs.find(root_files, {
  stop = vim.uv.os_homedir(),
  upward = true,
})

lsp_utils.setup_lsp({
  cmd = { "nil" },
  filetypes = { "nix" },
  single_file_support = true,
  root_dir = vim.fs.dirname(paths[1]),
  settings = {
    ["nil"] = {
      formatting = { command = { "nixpkgs-fmt" } },
      nix = {
        flake = {
          autoArchive = false, -- I don't need this until the autoEvalInputs in fixed
          autoEvalInputs = false, -- Nil doesn't handle well some inputs for the moment
        },
      },
    },
  },
})
