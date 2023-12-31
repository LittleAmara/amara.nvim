local async = require("utils.async")
local M = {}

local _default_opts = {
  on_init = function(client, _)
    if client.server_capabilities.documentFormattingProvider then
      local bufopts = { noremap = true, silent = true, buffer = vim.api.nvim_get_current_buf() }
      vim.keymap.set("n", "<space><space>", function()
        vim.lsp.buf.format({ async = true })
      end, bufopts)
    else
      vim.notify(("The client %s does not support formatting"):format(client.name), vim.log.levels.WARN)
    end
  end,
}

--- Setup a language server protocol in a non blocking way with |vim.schedule|
---@param opts table: See |vim.lsp.start_client|
function M.setup_lsp(opts)
  async.run(function()
    local final_opts = vim.tbl_deep_extend("force", _default_opts, opts)

    local client_id = vim.lsp.start(final_opts or {})

    if client_id == nil then
      return
    end

    local client = vim.lsp.get_client_by_id(client_id)

    if client == nil then
      return
    end
  end)
end

return M
