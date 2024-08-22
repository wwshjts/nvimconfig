require('telescope').setup {
    defaults = {
        layout_config = {
            preview_cutoff = 40, -- when columns are less than this value, the preview will be disabled
        },

    },
}


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
