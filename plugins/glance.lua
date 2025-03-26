return {
  "dnlhc/glance.nvim",
  requirements = "lspconfig",
  lazy = false,
  config = function()
    require("glance").setup()
  end,
  init = function()
    vim.keymap.set("n", "gD", "<CMD>Glance definitions<CR>")
    vim.keymap.set("n", "gR", "<CMD>Glance references<CR>")
    vim.keymap.set("n", "gY", "<CMD>Glance type_definitions<CR>")
    vim.keymap.set("n", "gM", "<CMD>Glance implementations<CR>")
  end,
}
