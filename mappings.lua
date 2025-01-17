local M = {}

M.dap = {
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Toggle Breakpoint",
    },
  },
}

M.crates = {
  n = {
    ["<leader>rcu"] = {
      function()
        require("crates").upgrade_all_crates()
      end,
      "Upgrade all crates",
    },
  },
}

M.finder = {
  n = {
    ["<leader>fc"] = {
      function()
        require("telescope.builtin").find_files {
          prompt_title = "Config Files",
          cwd = "~/.config/nvim/lua/custom",
          follow = true,
        }
      end,
      "Find config files",
    },
  },
}

M.tmuxnavigator = {
  n = {
    ["<c-h>"] = { "<cmd>TmuxNavigateLeft<cr>" },
    ["<c-j>"] = { "<cmd>TmuxNavigateDown<cr>" },
    ["<c-k>"] = { "<cmd>TmuxNavigateUp<cr>" },
    ["<c-l>"] = { "<cmd>TmuxNavigateRight<cr>" },
  },
}

M.neotest = {
  n = {
    ["<leader>tt"] = { "<cmd>Neotest run<cr>" },
  },
}

M.git = {
  n = {
    ["<leader>gB"] = { "<cmd>Git blame<cr>", "Blame buffer" },
    ["<leader>gr"] = { "<cmd>Git reset_hunk<cr>", "Reset hunk" },
    ["<leader>gR"] = { "<cmd>Git reset_buffer<cr>", "Reset buffer" },
    ["<leader>gd"] = { "<cmd>Git preview_hunk_inline<cr>", "Show hunk" },
    ["<leader>gs"] = { "<cmd>Git stage_hunk<cr>", "Stage hunk" },
    ["<leader>gS"] = { "<cmd>Git stage_buffer<cr>", "Stage buffer" },
    ["<leader>gu"] = { "<cmd>Git undo_stage_hunk<cr>", "Unstage hunk" },
  },
}

M.packageinfo = {
  n = {
    ["<leader>pv"] = { "<cmd>lua require('package-info').change_version()<cr>", "Change package version" },
  },
}

return M
