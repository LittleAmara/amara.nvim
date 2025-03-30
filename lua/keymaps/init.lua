local default_ops = { noremap = true, silent = true }

-- Clipboard shortcut
vim.keymap.set("v", "<leader>y", '"+y', default_ops)

-- vim.keymap.set jk/kj to go back to normal mode
vim.keymap.set("i", "jk", "<Esc>", default_ops)

-- vim.keymap.set double leader to remove search highlighting
vim.keymap.set("n", "<leader><leader>", "<cmd>noh<cr>", default_ops)

-- Pepega braces
-- vim.keymap.set('i', '{<CR>', '<ESC>o{<CR>}<UP><CR>')
vim.keymap.set("i", "{<CR>", "{<CR>}<UP><END><CR>")

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, default_ops)
vim.keymap.set("n", "[d", vim.diagnostic.get_prev, default_ops)
vim.keymap.set("n", "]d", vim.diagnostic.get_next, default_ops)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, default_ops)

-- Testing surrounding
vim.keymap.set("v", '<leader>"', [[c"<c-r>""<esc>]], default_ops)
vim.keymap.set("v", "<leader>'", [[c'<c-r>"'<esc>]], default_ops)

-- Lsp
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = function(event)
    local bufopts = { noremap = true, silent = true, buffer = event.buf }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "K", function ()
       vim.lsp.buf.hover({ border = vim.o.winborder })
    end, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "<space><space>", function()
      vim.lsp.buf.format({ async = true })
    end, bufopts)
  end,
})

-- Misc
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { silent = true })
