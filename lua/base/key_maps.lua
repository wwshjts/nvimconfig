local map = vim.api.nvim_set_keymap 

local options = { noremap = true, silent = true } -- if command already exists, then override it

function nm(key, command)
    map('n', key, command, options)
end

function im(key, command)
    map('i', key, command, options)
end

-- remap space to leader
function map_space_to_leader()
    map('', "<Space>", "<Nop>", options)
    vim.g.mapleader = " "
    vim.g.maplocalleader = " "
end
