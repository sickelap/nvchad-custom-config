return {
  "simrat39/rust-tools.nvim",
  dependencies = "neovim/nvim-lspconfig",
  ft = "rust",
  opts = function()
    return require "custom.configs.rust-tools"
  end,
  config = function(_, opts)
    require("rust-tools").setup(opts)
  end,
}
