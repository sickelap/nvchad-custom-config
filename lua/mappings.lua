require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", "<leader>fc",
  function()
    require("telescope.builtin").find_files {
      prompt_title = "Config Files",
      cwd = "~/.config/nvim/lua",
      follow = true,
    }
  end, { desc = "Find config files" }
)

map("n", "<c-h>", "<cmd>TmuxNavigateLeft<cr>")
map("n", "<c-j>", "<cmd>TmuxNavigateDown<cr>")
map("n", "<c-k>", "<cmd>TmuxNavigateUp<cr>" )
map("n", "<c-l>", "<cmd>TmuxNavigateRight<cr>" )

map("n", "<leader>gB", "<cmd>Git blame<cr>", { desc = "Blame buffer" })
map("n", "<leader>gr", "<cmd>Git reset_hunk<cr>", { desc = "Reset hunk" })
map("n", "<leader>gR", "<cmd>Git reset_buffer<cr>", { desc = "Reset buffer" })
map("n", "<leader>gd", "<cmd>Git preview_hunk_inline<cr>", { desc = "Show hunk" })
map("n", "<leader>gs", "<cmd>Git stage_hunk<cr>", { desc = "Stage hunk" })
map("n", "<leader>gS", "<cmd>Git stage_buffer<cr>", { desc = "Stage buffer" })
map("n", "<leader>gu", "<cmd>Git undo_stage_hunk<cr>", { desc = "Unstage hunk" })
