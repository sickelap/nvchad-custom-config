local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      current_line_blame_formatter = "<author_time:%Y-%m-%d> - <author>",
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- language servers
        "ansible-language-server",
        "bash-language-server",
        "css-lsp",
        "dockerfile-language-server",
        "emmet-ls",
        "eslint-lsp",
        "gopls",
        "html-lsp",
        "json-lsp",
        "lua-language-server",
        "python-lsp-server",
        "rust-analyzer",
        "terraform-ls",
        "typescript-language-server",
        "yaml-language-server",
        "ltex-ls",
        "jinja-lsp",

        -- linters
        "stylua",
        "eslint_d",
        "ansible-lint",
        "tflint",
        "pyright",
        "shellcheck",
        "flake8",

        -- formatters
        "shfmt",
        "black",
        "isort",
        "prettier",
      },
    },
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    dependencies = "neovim/nvim-lspconfig",
    ft = "rust",
    opts = function()
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },
  {
    dir = "Saecki/crates.nvim",
    ft = { "rust", "toml" },
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
      crates.show()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require "plugins.configs.cmp"
      table.insert(M.sources, { name = "crates" })
      return M
    end,
  },
  { "MunifTanjim/nui.nvim" },
  {
    "vuki656/package-info.nvim",
    requires = "MunifTanjim/nui.nvim",
    ft = "json.packagejson",
    config = function()
      local info = require "package-info"
      info.setup()
      info.show()
    end,
  },
  {
    "dnlhc/glance.nvim",
    requirements = "lspconfig",
    lazy = false,
    config = function()
      require("glance").setup()
    end,
    init = function()
      vim.keymap.set("n", "gD", "<CMD>Glance definitions<CR>")
      vim.keymap.set("n", "gR", "<CMD>Glance references<CR>")
      vim.keymap.set("n", "gY", "<CMD>Glance type_definitions<CR>")
      vim.keymap.set("n", "gM", "<CMD>Glance implementations<CR>")
    end,
  },
  {
    "mfussenegger/nvim-lint",
    ft = { "javascript", "typescript", "typescriptreact", "javascriptreact", "terraform" },
    config = function()
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup {}
    end,
  },
  {
    "RRethy/vim-illuminate",
    ft = { "typescript", "javascript", "rust" },
  },
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require "conform"
      conform.setup {
        formatters_by_ft = {
          typescript = { "prettier", "eslint_d" },
          typescriptreact = { "prettier", "eslint_d" },
          javascript = { "prettier", "eslint_d" },
          javascriptreact = { "prettier", "eslint_d" },
          lua = { "stylua" },
          python = { "black", "isort", "flake8" },
          html = { "htmlbeautifier" },
          bash = { "beautysh" },
          proto = { "buf" },
          rust = { "rustfmt" },
          yaml = { "yamlfix" },
          toml = { "taplo" },
          terraform = { "tflint" },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
      }
    end,
  },
  {
    "Wansmer/symbol-usage.nvim",
    event = "BufReadPre",
    config = function()
      require("symbol-usage").setup()
    end,
  },
  {
    "TabbyML/vim-tabby",
    lazy = false,
    config = function()
      vim.g.tabby_trigger_mode = "manual"
      -- vim.g.tabby_keybinding_accept = "<Tab>"
      -- vim.g.tabby_keybinding_trigger_or_dismiss = "<C-\\>"
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
      {
        "<leader>tx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>tX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>tL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>tQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",

      -- runners
      "haydenmeade/neotest-jest",
      "nvim-neotest/neotest-python",
    },
  },
}

return plugins
