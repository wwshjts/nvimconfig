local map = vim.api.nvim_set_keymap 

--[[
    noremap: if command already exists, then override it
    silent: command messages will not be given or added to the message history.
--]]
local options = { noremap = true, silent = true }

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
