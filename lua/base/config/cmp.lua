local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
    return
end

require("luasnip/loaders/from_vscode").lazy_load()

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    mapping = {

		-- Вызов меню автодополнения
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		['<CR>'] = cmp.config.disable,                      -- Disable <Enter> confirmation
		['<C-y>'] = cmp.mapping.confirm({ select = true }),

		['<C-e>'] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
		['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
	},

    sources = cmp.config.sources({
		{ name = 'luasnip' },       -- snippet engine
		{ name = 'buffer' },        -- buffer completition 
		{ name = 'path' },          -- path completition
        { name = 'nvim_lua' },      -- lua api completition

        { name = 'nvim_lsp' },      -- lsp completition 
        { name = 'nvim_lsp_signature_help' },
	}, {
	}),
}
