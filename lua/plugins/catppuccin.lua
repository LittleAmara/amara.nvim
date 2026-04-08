return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  lazy = false,
  build = function()
    require("catppuccin").compile()
  end,
  opts = {
    flavour = "auto",
    background = {
      light = "latte",
      dark = "mocha",
    },
    transparent_background = true,
    custom_highlights = function(colors)
      return {
        Normal = { bg = colors.none },
        NormalNC = { bg = colors.none },
        NormalSB = { bg = colors.none },
        Pmenu = { fg = "#9399b3", bg = "None" },
        NormalFloat = { link = "Pmenu" },
        FloatBorder = { bg = "None" },
        BlinkCmdMenu = { bg = "None" },
        TelescopeBorder = { link = "FloatBorder" },
        TelescopeTitle = { bg = "None" },
        BlinkCmpMenuBorder = { link = "FloatBorder" },
        Number = { fg = colors.flamingo },
        Boolean = { fg = colors.flamingo },
        Constant = { fg = colors.sapphire },
      }
    end,
    config = function(_, opts)
      require("catppuccin").setup(opts)
    end,
    init = function()
      vim.cmd.colorscheme "catppuccin-nvim"
    end,
    integrations = {
      alpha = true,
      cmp = true,
      gitsigns = true,
      telescope = true,
      treesitter = true,
      noice = true,
    },
  },
}
