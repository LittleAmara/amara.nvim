return {
  "folke/noice.nvim",
  event = "BufEnter",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  opts = {
    messages = {
      enabled = false,
    },
    cmdline = {
      view = "cmdline",
      enabled = false,
    },
    views = {
      mini = {
        align = "message-right",
        position = {
          row = "95%",
          col = "100%",
        },
        border = {
          style = "none",
        },
      },
      hover = {
        border = {
          style = "none",
        },
        position = { row = 2, col = 0 },
      },
    },
    -- lsp = {
    --   override = {
    --     ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
    --     ["vim.lsp.util.stylize_markdown"] = true,
    --     -- ["cmp.entry.get_documentation"] = true,
    --   },
    -- },
    presets = {
      bottom_search = true,
      long_message_to_split = true,
      inc_rename = false, -- enables an input dialog for inc-rename.nvim
      -- lsp_doc_border = false, -- add a border to hover docs and signature help
    },
  },
}
