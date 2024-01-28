return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
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
    { "<leader>-", "<cmd>Oil<cr>", desc = "Open parent directory" },
  },
}
