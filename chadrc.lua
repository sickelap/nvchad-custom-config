---@type ChadrcConfig
local M = {}

M.ui = { theme = "catppuccin" }
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

local api = vim.api

api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "package.json",
  callback = function()
    vim.bo.filetype = "json.packagejson"
  end,
})

local comment_color = "#888888"
local select_color = "#4f5431"

api.nvim_set_hl(0, "@comment", { fg = comment_color })
api.nvim_set_hl(0, "Visual", { bg = select_color })
api.nvim_set_hl(0, "FloatBorder", { bg = "NONE", ctermfg = "NONE" })
api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { fg = "#906029" })

return M
