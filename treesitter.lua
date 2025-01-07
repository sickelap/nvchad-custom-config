require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "terraform",
    "python",
    "css",
    "html",
    "typescript",
    "bash",
    "c",
    "htmldjango",
    "json",
  },
  highlight = {
    enable = function(bufnr)
      local max_size = 100 * 1024
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(bufnr))
      if ok and stats.size > max_size then
        return false
      end
      return true
    end,
    additional_vim_regex_highlighting = false,
  },
}
