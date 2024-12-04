---@type ChadrcConfig
local M = {}

M.ui = { theme = "catppuccin" }
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "package.json",
  callback = function()
    vim.bo.filetype = "json.packagejson"
  end,
})

-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--   callback = function()
--     vim.lsp.buf.format()
--   end
-- })

vim.api.nvim_set_hl(0, "Visual", { bg = "#4c566a" })
-- vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermfg = "NONE" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE", ctermfg = "NONE" })

return M
