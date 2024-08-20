-- TODO
local servers = {
    "pyright",
    "clangd",
    "lua_ls"
}

local lsp_zero = require("lsp-zero")

local lsp_attach = function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end

-- should be executed before any lsp setup
lsp_zero.extend_lspconfig({
    sign_text = true,
    lsp_attach = lsp_attach,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

require("mason-lspconfig").setup {
    ensure_installed = servers,
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    }
}
