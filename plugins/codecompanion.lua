return {
  "olimorris/codecompanion.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-lualine/lualine.nvim",
    "hrsh7th/nvim-cmp", -- Optional: For using slash commands and variables in the chat buffer
    "nvim-telescope/telescope.nvim", -- Optional: For using slash commands
    { "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown", "codecompanion" } }, -- Optional: For prettier markdown rendering
    { "stevearc/dressing.nvim", opts = {} }, -- Optional: Improves `vim.ui.select`
  },
  config = true,
  opts = {
    strategies = {
      chat = {
        adapter = "ollama",
      },
      inline = {
        adapter = "ollama",
      },
    },
  },
  setup = function()
    require("codecompanion").setup {
      adapters = {
        ollama = function()
          return require("codecompanion.adapters").extend("ollama", {
            schema = {
              model = {
                default = "coder",
              },
            },
          })
        end,
      },
    }
  end,
}
