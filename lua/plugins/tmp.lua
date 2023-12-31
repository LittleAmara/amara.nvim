return {
  "neovim/nvim-lspconfig",
  lazy = false,
  config = function()
    require("lspconfig")
    -- require'lspconfig'.pyright.setup{}
  end,
}
