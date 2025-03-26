return {
  "nvim-telescope/telescope-live-grep-args.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  setup = function()
    local telescope = require "telescope"
    telescope.setup {
      extensions = {
        live_grep_args = {
          noremap = true,
          auto_quoting = true,
        },
      },
    }
    telescope.load_extension "live_grep_args"
  end,
}
