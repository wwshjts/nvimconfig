local has_servers, servers = require("base/lsp/servers")

if not has_servers then
    vim.notify("File base/lsp/servers.lua not found")
    return
end

local lsp = require("lsp-zero")

-- lsp_attach is where you enable features that only work
-- if there is a language server active in the file
local lsp_attach = function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
end

-- should be executed before any lsp setup
lsp.extend_lspconfig({
    sign_text = true,
    lsp_attach = lsp_attach,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

require("mason").setup {} -- TODO merge with config/mason.lua
require("mason-lspconfig").setup {
    ensure_installed = servers,

    -- this first function is the "default handler"
    -- it applies to every language server without a "custom handler"
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    }
}
