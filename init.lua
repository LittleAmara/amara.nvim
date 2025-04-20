-- Exit if neovim version is under 0.11
if not vim.fn.has("nvim-0.11") then
  vim.notify("Neovim version must be >= 0.11 for this configuration to work properly", vim.log.levels.ERROR)
  vim.fn.getchar()
  os.exit(1)
end

-- Setup lazy if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("settings")
require("keymaps")

-- Do not load plugins if in vscode
if vim.g.vscode then
  return
end

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
  rocks = {
    enabled = false,
  }
})

