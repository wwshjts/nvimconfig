require('base.key_maps')

require('nvim-tree').setup({
    view = {
        width = 25,
    },
    filters = {
        -- hide dotfiles
        dotfiles = true,
    },
})

nm('<leader>e', ':NvimTreeToggle <cr>')

