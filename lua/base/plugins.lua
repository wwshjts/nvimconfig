local fn = vim.fn

-- [[ Automatically install packer ]] --
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth", "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end
-- enable if you want to sync Packer after editing this file [[
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]
--]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then return
end

-- [[ Packer window ]] --
packer.init {
    display = {
    open_fn = function()
        return require("packer.util").float { border = "rounded" }
    end,
    },
}

-- [[ Plugin setup ]] --
return packer.startup(function(use)

    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

    -- [[ Colorshemes ]] --
    use "vague2k/vague.nvim"
    use "sainnhe/everforest"
    use { "catppuccin/nvim", as = "catppuccin" }

    -- [[ Completition setup ]] --
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            use "L3MON4D3/LuaSnip", --snippet engine
            use "rafamadriz/friendly-snippets", -- snippets for a test
            use "saadparwaiz1/cmp_luasnip", -- snippet completions
            use "hrsh7th/cmp-buffer", -- buffer completions
            use "hrsh7th/cmp-path", -- path completions
            use "hrsh7th/cmp-cmdline", -- cmdline completions
            use "hrsh7th/cmp-nvim-lua", -- lua api in nvim

            use "hrsh7th/cmp-nvim-lsp",
            use "hrsh7th/cmp-nvim-lsp-signature-help",
      },
      config = function()
          require("base/config/cmp")
      end
    }

    -- [[ LSP ]] --
    use {
        "williamboman/mason.nvim",
        requires = {
            use "williamboman/mason-lspconfig.nvim"
        },
        config = function() require("base/config/mason") end,
    }

    use "neovim/nvim-lspconfig"

    use { 'VonHeikemen/lsp-zero.nvim', branch = 'v4.x' }

    -- [[ Treesitter ]] --
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function() require("base/config/treesitter") end,
    }

    -- [[ Telescope ]] --
    use {
        "nvim-telescope/telescope.nvim", tag = '0.1.8',
        config = function() require("base/config/telescope") end,
    }

    -- [[ Metals ]] --
    -- Plugin for scala development
    use {
        "scalameta/nvim-metals",
        config = function() require("base/config/metals") end,
    }


    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
