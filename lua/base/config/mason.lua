-- TODO add this servers to another file
local servers = {
    "pyright",
    "clangd",
    "lua_ls"
}

require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = servers,
}
