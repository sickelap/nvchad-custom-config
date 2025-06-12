local options = {
  formatters_by_ft = {
    typescript = { "prettier", "eslint_d" },
    typescriptreact = { "prettier", "eslint_d" },
    javascript = { "prettier", "eslint_d" },
    javascriptreact = { "prettier", "eslint_d" },
    lua = { "stylua" },
    python = { "ruff_format", "ruff_fix" },
    html = { "htmlbeautifier" },
    bash = { "beautysh" },
    proto = { "buf" },
    rust = { "rustfmt" },
    yaml = { "yamlfix" },
    toml = { "taplo" },
    terraform = { "tflint" },
  },
  format_on_save = {
    lsp_fallback = true,
  },
}

return options
