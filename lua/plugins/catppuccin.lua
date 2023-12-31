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
        Pmenu = { bg = "None" },
        PmenuSel = { bg = "None" },
        NormalFloat = { bg = "None" },
        Number = { fg = colors.flamingo },
        Boolean = { fg = colors.flamingo },
        Constant = { fg = colors.sapphire },
        FloatBorder = { fg = colors.maroon },
      }
    end,
    integrations = {
      alpha = true,
      cmp = true,
      gitsigns = true,
      telescope = true,
      treesitter = true,
      noice = true,
      flash = true,
    },
  },
}
