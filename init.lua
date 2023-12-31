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

  defaults = {
    lazy = true,
  },
})

-- require("lazy-config")
require("keymaps")

vim.schedule(function()
  vim.diagnostic.config({
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = "✘",
        [vim.diagnostic.severity.WARN] = "▲",
        [vim.diagnostic.severity.HINT] = "⚑",
        [vim.diagnostic.severity.INFO] = "»",
      },
    },
  })

  vim.api.nvim_create_autocmd("LspAttach", {
    desc = "Enable inlay hints",
    callback = function(event)
      local id = vim.tbl_get(event, "data", "client_id")
      local client = id and vim.lsp.get_client_by_id(id)
      if client == nil or not client.supports_method("textDocument/inlayHint") then
        return
      end

      -- warning: this api is not stable yet
      vim.lsp.inlay_hint.enable(event.buf, true)
    end,
  })
end)

vim.api.nvim_create_user_command("Redir", function(ctx)
  local lines = vim.split(vim.api.nvim_exec(ctx.args, true), "\n", { plain = true })
  vim.cmd("new")
  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  vim.opt_local.modified = false
end, { nargs = "+", complete = "command" })
