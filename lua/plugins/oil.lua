return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  enabled = false, -- testing if telescope file browser if sufficient
  opts = {
    columns = {
      "icon",
      { "permissions", highlight = "Exception" },
    },
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name, _)
        return (name == "..")
      end,
    },
    float = {
      win_options = {
        winblend = 0,
      },
    },
  },
  keys = {
    { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
    { "<leader>-", "<cmd>Oil --float<cr>", desc = "Open parent directory in a floating window" },
  },
}
