local configs = require "plugins.configs.lspconfig"

local on_init = configs.on_init
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"

local servers = {
  "ansiblels",
  "bashls",
  "yamlls",
  "dockerls",
  "docker_compose_language_service",
  "jsonls",
  "pyright",
  "terraformls",
  "tsserver",
  "ltex",
  "jinja_lsp",
  "cssls",
  "html",
  "emmet_ls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_init = on_init,
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
