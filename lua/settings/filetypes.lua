vim.filetype.add({
  extension = {
    templ = "templ",
    mdx   = "markdown"
    -- yml = "yaml.ansible"
  },
  pattern = {
    [".*%.blade%.php"] = { "php", priority = 10 }, -- required for intelephense
    [".*%.tf"] = "terraform",
    [".*%.yaml.tftpl"] = "yaml",
  }
})
