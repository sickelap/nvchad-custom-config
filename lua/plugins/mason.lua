return {
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
      -- "ltex-ls",
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
}
