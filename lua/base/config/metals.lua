
local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "scala", "sbt", "java" },
    callback = function()
        require("metals").initialize_or_attach({})
    end,
    group = nvim_metals_group,
})

-- TODO vim.g['metals_status']
-- vim.g['metals_bsp_status']
local metals_config = require("metals").bare_config()
metals_config.init_options.statusBarProvider = "on" -- Built-in metals status bar TODO change to fidget
metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.opt_global.shortmess:remove("F") -- Without this some messages from plugin will be prohibited
