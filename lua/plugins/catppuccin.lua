return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  build = function()
    require("catppuccin").compile()
  end,
  init = function()
    vim.cmd.colorscheme("catppuccin")
  end,
  opts = {
    flavour = "mocha",
    background = {
      light = "latte",
      dark = "mocha",
    },
    transparent_background = true,
    custom_highlights = function(colors)
      return {
        Pmenu = { fg = "#9399b3", bg = "None" },
        NormalFloat = { link = "Pmenu" },
        FloatBorder = { bg = "None" },
        TelescopeBorder = { link = "FloatBorder" },
        TelescopeTitle = { bg = "None" },
        BlinkCmpMenuBorder = { link = "FloatBorder" },
        Number = { fg = colors.flamingo },
        Boolean = { fg = colors.flamingo },
        Constant = { fg = colors.sapphire },
      }
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
