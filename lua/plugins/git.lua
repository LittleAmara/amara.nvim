return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
  },
  cmd = "Neogit",
  ft = "gitcommit",
  keys = {
    { "<leader>g", "<cmd>Neogit<cr>", desc = "neogit" },
  },
  opts = {
    integrations = {
      diffview = true,
      telescope = true,
    },
    disable_commit_confirmation = true,
  },
}
