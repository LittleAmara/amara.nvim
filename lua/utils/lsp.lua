local M = {}

local _default_opts = {
  on_attach = function(client, _)
    local bufopts = { noremap = true, silent = true, buffer = vim.api.nvim_get_current_buf() }
    if client.server_capabilities.documentFormattingProvider then
      vim.keymap.set("n", "<space><space>", function()
        vim.lsp.buf.format({ async = true })
      end, bufopts)
    end
  end,
}

--- Setup a language server protocol
---@param opts table: See |vim.lsp.start_client|
function M.setup_lsp(opts)
  local final_opts = vim.tbl_deep_extend("force", _default_opts, opts)

  vim.lsp.start(final_opts or {})
end

return M
