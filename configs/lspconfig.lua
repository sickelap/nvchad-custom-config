local on_init = require("plugins.configs.lspconfig").on_init
-- local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- local util = require "lspconfig.util"

local on_attach = function(client, bufnr)
  require("plugins.configs.lspconfig").on_attach(client, bufnr)
  client.server_capabilities.documentFormattingProvider = true
end

local servers = {
  "tsserver",
  "pyright",
  "docker_compose_language_service"
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_init = on_init,
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- lspconfig.tsserver.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   root_dir = util.root_pattern("package.json", ".git"),
-- }
--
-- lspconfig.pyright.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetype = { "python" },
-- }
--
-- lspconfig.docker_compose_language_service.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { "yaml" },
--   root_dir = lspconfig.util.root_pattern("docker-compose.yml"),
-- }
