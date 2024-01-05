-- Only keeping it for debug, soon my version I will write my own "LspInfo"

return {
  "neovim/nvim-lspconfig",
  cmd = "LspInfo",
  config = function()
    require("lspconfig.ui.windows").default_options.border = "rounded"
  end,
}
