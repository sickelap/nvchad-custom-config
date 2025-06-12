return {
  "nvim-tree/nvim-tree.lua",
  config = function()
    vim.cmd [[
      highlight NvimTreeGitDeleted guifg=#a6a6a6
      highlight NvimTreeGitDirty guifg=#e5c07b
      highlight NvimTreeIgnored guifg=#e5c07b
      highlight NvimTreeGitMerge guifg=#ff0000
      highlight NvimTreeGitNew guifg=#4cc77b
      highlight NvimTreeGitRenamed guifg=#e5c07b
      highlight NvimTreeGitStaged guifg=#b0d6be

      "highlight NvimTreeGitDeleted guifg=#e06c75
      "highlight NvimTreeGitDirty guifg=#e5c07b
      "highlight NvimTreeIgnored guifg=#a6a6a6
      "highlight NvimTreeGitMerge guifg=#ff0000
      "highlight NvimTreeGitNew guifg=#4cc77b
      "highlight NvimTreeGitRenamed guifg=#cdcfa5
      "highlight NvimTreeGitStaged guifg=#b0d6be
      "
      "highlight NvimTreeFolderDeleted guifg=#e5c07b
      "highlight NvimTreeFolderDirty guifg=#e5c07b
      "highlight NvimTreeFolderIgnored guifg=#e5c07b
      "highlight NvimTreeFolderMerge guifg=#e5c07b
      "highlight NvimTreeFolderNew guifg=#98c379
      "highlight NvimTreeFolderRenamed guifg=#e5c07b
      "highlight NvimTreeFolderStaged guifg=#e5c07b
    ]]
    require("nvim-tree").setup {
      filters = {
        dotfiles = false,
        -- custom = { ".git", "node_modules", "__pycache__", "dist", ".DS_Store" },
      },
      git = {
        enable = true,
        show_on_dirs = false,
        show_on_open_dirs = true,
      },
      renderer = {
        highlight_git = true,
        icons = {
          show = {
            git = false,
          },
        },
      },
    }
  end,
}
