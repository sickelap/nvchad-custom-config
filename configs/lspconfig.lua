-- local on_init = require("plugins.configs.lspconfig").on_init
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = {
  "ansiblels",
  "bashls",
  "cssls",
  "dockerls",
  "docker_compose_language_service",
  "emmet_ls",
  "html",
  "jsonls",
  "pyright",
  "terraformls",
  "tsserver",
  "yamlls",
  "ltex",
  "jinja_lsp",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
