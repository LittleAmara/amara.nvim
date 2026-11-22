-- Godot integration: LSP, docs, run commands, scene tree, debugging.
-- The editor server pipe is handled by our own autocommand (settings/autocommands.lua).
return {
  "Mathijs-Bakker/godotdev.nvim",
  dependencies = {
    "mfussenegger/nvim-dap",
    { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
    "nvim-treesitter/nvim-treesitter",
  },
  ft = { "gdscript", "gdshader", "gdresource" },
  keys = {
    { "gK", "<cmd>GodotDocsCursor<cr>", ft = "gdscript", desc = "Godot docs under cursor" },
    { "<leader>r", "<cmd>GodotRunProject<cr>", desc = "Godot run project" },
    { "<leader>e", "<cmd>GodotSceneTree<cr>", desc = "Godot show scene tree" },
  },
  opts = {
    editor_port = tonumber(os.getenv("GDScript_Port") or "6005"),
    csharp = false,
    formatter = false,
    autostart_editor_server = false,
    treesitter = { auto_setup = false },
  },
}
