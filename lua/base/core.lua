local opt = vim.opt

opt.compatible = false -- vi compatibility

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

-- [[ other ]] --
opt.clipboard = "unnamedplus" -- use system clipboard
vim.cmd [[autocmd BufEnter * set fo-=c fo-=r fo-=o]] -- no autocomments
