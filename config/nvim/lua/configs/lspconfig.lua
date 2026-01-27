-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

-- local lspconfig = require "lspconfig"
-- local nvlsp = require "nvchad.configs.lspconfig"

local servers = {
  -- "asm_lsp",
  "clangd",
  "cssls",
  "dockerls",
  "gopls",
  "html",
  "pylsp",
  -- "rust_analyzer",
  "ts_ls",
  "jdtls",
}

-- lsps with default config (DEPRECATED)
-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = nvlsp.on_attach,
--     on_init = nvlsp.on_init,
--     capabilities = nvlsp.capabilities,
--   }
-- end
vim.lsp.enable(servers)

-- configuring single server, example: typescript
-- vim.lsp.config("ts_ls", {
--   flags = { debounce_text_changes = 300 }
-- })
