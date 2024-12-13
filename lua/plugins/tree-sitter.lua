return {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })
  end,
  event = { "BufReadPost", "BufNewFile", "CmdlineEnter" },
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
  },
  config = function(_, opts)
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.blade = {
      install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = {"src/parser.c"},
        branch = "main",
      },
      filetype = "blade"
    }
    require("nvim-treesitter.configs").setup(opts)
  end,
}
