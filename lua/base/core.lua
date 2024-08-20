require('/base/key_maps')

local opt = vim.opt

opt.compatible = false -- vi compatibility

-- leaded is key for user mappings,
-- just override it if you prefer another button
map_space_to_leader()

-- [[ lines enumeration ]] --
opt.number = true
opt.relativenumber = true

-- [[ search ]] --
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- [[ tabs and indentation ]] --
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4

opt.expandtab = true
opt.smarttab = true
opt.autoindent = true
opt.smartindent = true

-- [[ window splitting ]] --
opt.splitright = true       -- spawn new window to the right
nm("<C-s>", ":vsp<CR>")     -- open new window with same file
nm("<C-n>", ":vnew<CR>")    -- open new window with empty file
nm("<C-l>", "<C-w>l")
nm("<C-k>", "<C-w>k")
nm("<C-j>", "<C-w>j")
nm("<C-h>", "<C-w>h")
nm("<C-o>", "<C-w>w")       -- move coursor to the next window
nm("<C-p>", "<C-w>p")       -- move coursor to the last window

-- [[ default explorer ]] --
nm("<leader>e", ":Lex 20 <cr>") -- show default explorer

-- [[ other ]] --
opt.clipboard = "unnamedplus"                           -- use system clipboard
vim.cmd [[autocmd BufEnter * set fo-=c fo-=r fo-=o]]    -- no autocomments
opt.termguicolors = true                                -- use terminal colors in gui
