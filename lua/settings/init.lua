vim.g.mapleader = "," -- Make sure to set `mapleader` before lazy so your mappings are correct

local set = vim.opt

set.termguicolors = true

-- mouse
set.mouse = ""

-- search help
set.ignorecase = true
set.smartcase = true
set.hlsearch = true
set.incsearch = true
-- set noswapfile

-- space help
set.list = true
set.listchars = { tab = "> ", trail = "." }

-- tab help
set.expandtab = true
set.smarttab = true
set.shiftwidth = 4
set.tabstop = 8

-- The number of spaces inserted when you press tab.
-- -1 means the same value as shiftwidth
set.softtabstop = -1

-- menu
set.wildmenu = true
set.wildmode = "longest,full"
set.completeopt = "menu,menuone,noselect"

-- linebreak
set.lbr = true
set.tw = 500

-- Set the minimal amount of lignes under and above the cursor
-- Useful for keeping context when moving with j/k
set.scrolloff = 8

set.ai = true -- Auto indent
set.si = true -- Smart indent
set.wrap = true -- Wrap lines
set.swapfile = false

set.relativenumber = true
set.number = true

-- Set statusline
set.laststatus = 3 -- Global statusline
set.statusline = [[%<%f %h%m%r%=%-14.(%l,%c%V%) %y %P]]

-- Make the cmdline overlap the statusline when active
set.cmdheight = 0

-- Disable language provider support (lua and vimscript plugins only)
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0

-- Disable builtins plugins that I don't use
vim.g.loaded_gzip = 0
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1

vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_2html_plugin = 1

vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1

-- Apply automatically formatter

-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--   pattern = { "*.fish" },
--   command = "silent !fish_indent -w <afile>",
-- })

-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--   pattern = { "*.py" },
--   command = "silent !black <afile>",
-- })

-- Auto reload file when nvim resumes from a suspend state
vim.api.nvim_create_autocmd({ "VimResume" }, {
  command = "silent checktime",
  pattern = { "*" },
})

vim.filetype.add({
  {
    extension = {
      templ = "templ"
    }
  },
  {
    pattern = {
      [".*%.blade%.php"] = "blade",
    }
  }
})

-- Pretty printing for debug
P = function(v)
  print(vim.inspect(v))
  return v
end
