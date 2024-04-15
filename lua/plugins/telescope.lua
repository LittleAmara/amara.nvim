local _custom_ivy = {
  sorting_strategy = "ascending",
  layout_strategy = "bottom_pane",
  layout_config = {
    height = 15,
  },
  border = true,
  borderchars = {
    prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
    results = { " " },
    preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
  },
  previewer = false,
}

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    cmd = "Telescope",
    keys = {
      { "<leader>t", "<cmd>Telescope<cr>", desc = "Telescope" },
      { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Telescope find file" },
      { "-", "<cmd>Telescope file_browser<cr>", desc = "Telescope file browser" },
      { "<leader>b", "<cmd>Telescope buffers<cr>", desc = "Telescope buffers" },
      { "<leader><space>", "<cmd>Telescope git_files<cr>", desc = "Telescope git files" },
      { "<leader>s", "<cmd>Telescope git_status<cr>", desc = "Telescope git status" },
      { "<leader>G", "<cmd>Telescope live_grep<cr>", desc = "Telescope live grep" },
      { "<leader>h", "<cmd>Telescope help_tags<cr>", desc = "Telescope help tags" },
    },
    opts = {
      defaults = {
        mappings = {
          n = {
            ["w"] = false,
            ["q"] = function(prompt_bufnr)
              return require("telescope.actions").close(prompt_bufnr)
            end,
          },
          i = {
            ["<C-u>"] = false,
          },
        },
        layout_config = {
          horizontal = {
            prompt_position = "bottom",
          },
          bottom_pane = {
            height = 10,
            preview_cutoff = 120,
            prompt_position = "top",
          },
        },
        file_ignore_patterns = { "node_modules" },
      },
      pickers = {
        find_files = {
          find_command = { "fd", "--type", "f", "--strip-cwd-prefix", "--hidden", "--exclude", ".git" },
          theme = "dropdown",
          previewer = false,
        },
        git_files = {
          theme = "dropdown",
          previewer = false,
        },
        help_tags = {
          theme = "dropdown",
          previewer = false,
        },
      },
      extensions = {
        file_browser = vim.tbl_deep_extend("force", _custom_ivy, {
          hijack_netrw = true,
          hide_parent_dir = true,
          prompt_path = true,
          git_status = false,
          path = "%:p:h",
          dir_icon = " ",
          mappings = {
            ["n"] = {
              ["-"] = function(prompt_bufnr)
                return require("telescope._extensions.file_browser.actions").goto_parent_dir(prompt_bufnr, true)
              end,
            },
          },
        }),
      },
    },
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "Telescope file_browser",
    config = function(_, _)
      require("telescope").load_extension("file_browser")
    end,
  },
}
