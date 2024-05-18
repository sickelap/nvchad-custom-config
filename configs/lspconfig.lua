local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local util = require "lspconfig.util"

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = util.root_pattern("package.json", ".git"),
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetype = { "python" },
}
