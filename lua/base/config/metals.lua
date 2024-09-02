-- TODO vim.g['metals_status']
-- vim.g['metals_bsp_status']
local metals_config = require("metals").bare_config()
metals_config.init_options.statusBarProvider = "on" -- Built-in metals status bar TODO change to fidget
metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

metals_config.on_attach = function(client, bufnr)
    local opts = { buffer = bufnr }
    require("base.lsp.keymaps").my_keymaps(opts)

    -- enable telescope picker for metals commands
    vim.keymap.set('n', '<leader>fm', '<cmd> lua require("telescope").extensions.metals.commands()<cr>', opts)
end


local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "scala", "sbt", "java" },
    callback = function()
        require("metals").initialize_or_attach(metals_config)
    end,
    group = nvim_metals_group,
})

vim.opt_global.shortmess:remove("F") -- Without this some messages from plugin will be prohibited
