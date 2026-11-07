-- Auto reload file when nvim resumes from a suspend state
vim.api.nvim_create_autocmd({ "VimResume" }, {
  command = "silent checktime",
  pattern = { "*" },
})

-- Godot: listen on a project-local pipe so the Godot editor can open files in this instance
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    local root = vim.fs.root(vim.fn.getcwd(), "project.godot")
    if root == nil then
      return
    end
    vim.fn.mkdir(root .. "/.godot", "p")
    local pipe = root .. "/.godot/nvim.pipe"
    if pcall(vim.fn.serverstart, pipe) then
      return
    end
    -- Pipe already exists: leave it if another instance owns it, otherwise it is stale
    local ok, chan = pcall(vim.fn.sockconnect, "pipe", pipe, { rpc = true })
    if ok and chan > 0 then
      vim.fn.chanclose(chan)
      return
    end
    os.remove(pipe)
    -- Can still fail if the path exceeds the unix socket limit (~108 chars)
    if not pcall(vim.fn.serverstart, pipe) then
      vim.notify("Godot: failed to listen on " .. pipe, vim.log.levels.WARN)
    end
  end,
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
