if not vim.fn.has("nvim-0.11") then
  vim.notify("Neovim version must be >= 0.11 for this configuration to work properly", vim.log.levels.ERROR)
  return
end

-- Setup lazy if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("settings")
require("lazy").setup("plugins", {
  ui = {
    border = "rounded",
  },
  install = {
    colorscheme = { "catppuccin" },
  },
  change_detection = {
    enabled = false,
  },

  defaults = {
    lazy = true,
  },
})

require("keymaps")
