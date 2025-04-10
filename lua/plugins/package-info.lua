return {
  "vuki656/package-info.nvim",
  requires = "MunifTanjim/nui.nvim",
  ft = "json.packagejson",
  config = function()
    local info = require "package-info"
    info.setup()
    info.show()
  end,
}
