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
  }
}

return M
