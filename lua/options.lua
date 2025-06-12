require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

-- vim.opt.completeopt = { "menu", "menuone", "noselect" }

local api = vim.api

api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "package.json",
  callback = function()
    vim.bo.filetype = "json.packagejson"
  end,
})
