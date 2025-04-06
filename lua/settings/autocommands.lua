-- Auto reload file when nvim resumes from a suspend state
vim.api.nvim_create_autocmd({ "VimResume" }, {
  command = "silent checktime",
  pattern = { "*" },
})

-- FIXME: to remove after Telescope integrates the new winborder option
-- see https://github.com/nvim-telescope/telescope.nvim/issues/3436#issuecomment-2756267300
vim.api.nvim_create_autocmd("User", {
  pattern = "TelescopeFindPre",
  callback = function()
    vim.opt_local.winborder = "none"
    vim.api.nvim_create_autocmd("WinLeave", {
      once = true,
      callback = function()
        vim.opt_local.winborder = "rounded"
      end,
    })
  end,
})

-- Lsp
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = function(event)
    local bufopts = { noremap = true, silent = true, buffer = event.buf }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", function()
      return require("telescope.builtin").lsp_definitions()
    end, bufopts)
    vim.keymap.set("n", "K", function()
      vim.lsp.buf.hover({ border = vim.o.winborder })
    end, bufopts)
    vim.keymap.set("n", "gi", function()
      return require("telescope.builtin").lsp_implementations()
    end, bufopts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "gr", function()
      return require("telescope.builtin").lsp_references()
    end, bufopts)
    vim.keymap.set("n", "<space><space>", function()
      vim.lsp.buf.format({ async = true })
    end, bufopts)
    vim.keymap.set("n", "<space>d", function()
      return require("telescope.builtin").diagnostics()
    end, bufopts)
  end,
})
