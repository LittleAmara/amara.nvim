return {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })
  end,
  branch = "main",
  event = { "BufReadPost", "BufNewFile", "CmdlineEnter" },
  init = function()
    vim.api.nvim_create_autocmd('FileType', {
      callback = function()
      -- syntax highlighting, provided by Neovim
      pcall(vim.treesitter.start)
      -- indentation, provided by nvim-treesitter
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
    local ensure_installed = {
      "c",
      "cmake",
      "cpp",
      "fish",
      "go",
      "hcl",
      "nix",
      "python",
      "terraform",
      "javascript",
      "markdown",
      "markdown_inline",
      "vim",
      "bash",
      "regex",
      "lua",
    }
    local already_installed = require('nvim-treesitter.config').get_installed()
    local parsers_to_install = vim.iter(ensure_installed)
      :filter(function(parser)
        return not vim.tbl_contains(already_installed, parser)
      end)
      :totable()
    require('nvim-treesitter').install(parsers_to_install)

  end,
  opts = {
    ensure_installed = {
      "c",
      "cmake",
      "cpp",
      "fish",
      "go",
      "hcl",
      "nix",
      "python",
      "terraform",
      "javascript",
      "markdown",
      "markdown_inline",
      "vim",
      "bash",
      "regex",
      "lua",
    },
    sync_install = false,
    indent = {
      enable = true,
    },
    highlight = {
      enable = true,
    },
  }
}
