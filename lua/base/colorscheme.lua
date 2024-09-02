--local colorscheme = "vague"
local colorscheme = "everforest"
--local colorscheme = "catppuccin"

local status, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status then 
    vim.notify("colorscheme " .. colorscheme .. " not found")
    return
end
