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
