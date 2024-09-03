require('base.key_maps')

require('nvim-tree').setup({
    view = {
        width = 25,
    },
})

nm('<leader>e', ':NvimTreeToggle <cr>')

