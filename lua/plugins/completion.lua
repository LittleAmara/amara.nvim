-- return {
--   "hrsh7th/nvim-cmp",
--   event = { "InsertEnter", "CmdlineEnter" },
--   dependencies = {
--     "L3MON4D3/LuaSnip",
--     "onsails/lspkind.nvim",
--     "hrsh7th/cmp-buffer",
--     "hrsh7th/cmp-cmdline",
--     "hrsh7th/cmp-path",
--     "hrsh7th/cmp-nvim-lsp",
--   },
--   opts = function()
--     local cmp = require("cmp")
--     local luasnip = require("luasnip")
--
--     cmp.setup.cmdline({ "/", "?" }, {
--       mapping = cmp.mapping.preset.cmdline(),
--       sources = {
--         { name = "buffer" },
--       },
--     })
--
--     cmp.setup.cmdline(":", {
--       mapping = cmp.mapping.preset.cmdline(),
--       sources = cmp.config.sources({
--         { name = "path" },
--       }, {
--         { name = "cmdline" },
--       }),
--     })
--
--     return {
--       snippet = {
--         expand = function(args)
--           luasnip.lsp_expand(args.body)
--         end,
--       },
--       mapping = cmp.mapping.preset.insert({
--         ["<C-Space>"] = cmp.mapping.complete(),
--         ["<CR>"] = cmp.mapping.confirm({
--           behavior = cmp.ConfirmBehavior.Replace,
--           select = true,
--         }),
--         ["<Tab>"] = cmp.mapping(function(fallback)
--           if cmp.visible() then
--             cmp.select_next_item()
--           elseif luasnip.expand_or_jumpable() then
--             luasnip.expand_or_jump()
--           else
--             fallback()
--           end
--         end, { "i", "s" }),
--         ["<S-Tab>"] = cmp.mapping(function(fallback)
--           if cmp.visible() then
--             cmp.select_prev_item()
--           elseif luasnip.jumpable(-1) then
--             luasnip.jump(-1)
--           else
--             fallback()
--           end
--         end, { "i", "s" }),
--       }),
--       sources = cmp.config.sources({
--         { name = "nvim_lsp" },
--         { name = "luasnip" },
--         { name = "path" },
--       }),
--       formatting = {
--         format = function(entry, vim_item)
--           if vim.tbl_contains({ "path" }, entry.source.name) then
--             local icon, hl_group = require("nvim-web-devicons").get_icon(entry:get_completion_item().label)
--             if icon then
--               vim_item.kind = icon
--               vim_item.kind_hl_group = hl_group
--               return vim_item
--             end
--           end
--           return require("lspkind").cmp_format({ with_text = false })(entry, vim_item)
--         end,
--       },
--       window = {
--         completion = {
--           border = "rounded",
--           winhighlight = "FloatBorder:FloatBorder",
--         },
--         documentation = {
--           border = "rounded",
--           winhighlight = "FloatBorder:FloatBorder",
--         },
--       },
--       enabled = function()
--         if vim.bo.filetype == "TelescopePrompt" then
--           return false
--         end
--         return true
--       end,
--     }
--   end,
-- }

return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = { 'rafamadriz/friendly-snippets' },

  event = "BufEnter",

  branch = 'main',
  build = 'cargo build --release',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = {
      ["<Tab>"] = {
        function(cmp)
          return cmp.select_next()
        end,
        "snippet_forward",
        "fallback",
      },
      ["<S-Tab>"] = {
        function(cmp)
          return cmp.select_prev()
        end,
        "snippet_backward",
        "fallback",
      },
      ["<CR>"] = {
        function(cmp)
          local selected_item = require('blink.cmp.completion.list').get_selected_item()
          if cmp.is_visible then
            if selected_item ~= nil then
              return cmp.accept()
            end
          end
        end,
        "fallback"
      },
    },

    cmdline = {
      keymap = {
        ['<Tab>'] = {
          function(cmp)
            if cmp.is_ghost_text_visible() and not cmp.is_menu_visible() then return cmp.accept() end
          end,
          'show_and_insert',
          'select_next',
        },
      },
      completion = {
        menu = { auto_show = true },
        list = { selection = { preselect = false } },
      },
    },

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono'
    },

    signature = { enabled = true },

    -- (Default) Only show the documentation popup when manually triggered
    completion = {
      documentation = { auto_show = true },
      list = { selection = { preselect = false } },

      menu = {
        draw = {
            columns = { { 'kind_icon' }, { 'label', 'label_description', gap = 1 } },
        }
      }
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}
