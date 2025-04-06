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

-- Testing surrounding
vim.keymap.set("v", '<leader>"', [[c"<c-r>""<esc>]], default_ops)
vim.keymap.set("v", "<leader>'", [[c'<c-r>"'<esc>]], default_ops)

-- Misc
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { silent = true })
