return {
  "mfussenegger/nvim-lint",
  ft = { "javascript", "typescript", "typescriptreact", "javascriptreact", "terraform" },
  config = function()
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
