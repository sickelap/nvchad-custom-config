vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

local function update_nvim_tree_width()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.api.nvim_buf_get_option(buf, "filetype") == "NvimTree" then
      local max_width = 0
      local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)

      for _, line in ipairs(lines) do
        -- Remove any ANSI codes (not usually present, but safe)
        local plain_line = line:gsub("\27%[[%d;]*m", "")
        local width = vim.fn.strdisplaywidth(plain_line)
        max_width = math.max(max_width, width)
      end

      local final_width = math.max(30, math.min(50, max_width + 2)) -- Add small padding
      vim.api.nvim_win_set_width(win, final_width)
    end
  end
end

-- Trigger width update on relevant events
vim.api.nvim_create_autocmd(
  { "BufEnter", "BufWinEnter", "CursorMoved", "TextChanged", "TextChangedI", "WinScrolled" },
  {
    pattern = "NvimTree_*",
    callback = function()
      vim.defer_fn(update_nvim_tree_width, 30)
    end,
  }
)

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
