-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "catppuccin",

	hl_override = {
		Comment = { italic = true },
		["@comment"] = { italic = true },
	},
}

M.nvdash = { load_on_startup = false }
M.ui = {
  tabufline = {
    lazyload = false
  }
}

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
