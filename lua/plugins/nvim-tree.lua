return {
  "nvim-tree/nvim-tree.lua",
  config = function()
    require("nvim-tree").setup {
      filters = {
        dotfiles = false,
        custom = { ".git", "node_modules", "__pycache__", "dist", ".DS_Store" },
      },
      -- renderer = {
      --   icons = {
      --     glyphs = {
      --       git = {
      --         unstaged = "",
      --         staged = "",
      --         unmerged = "",
      --         renamed = "",
      --         untracked = "",
      --         deleted = "",
      --         ignored = "",
      --       },
      --     },
      --   },
      -- },
    }
  end,
}
