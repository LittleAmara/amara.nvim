return {
  "stevearc/oil.nvim",
  lazy = false,
  opts = {
    columns = {
      "icon",
      "permissions",
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
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
    { "<leader>-", "<cmd>Oil --float<cr>", desc = "Open parent directory in a floating window" },
  },
}
