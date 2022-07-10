-- This file is used for plugin management
-- Packer is used as a plugin manager

-- Map vim.fn to fn.
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float {
                border = "rounded"
            }
        end
    }
}

-- Install your plugins here
return packer.startup(function(use)

    ------------------------------------------------------------------------------------------
    -- IDE Dependencies
    ------------------------------------------------------------------------------------------

    -- Packer
    -- Have packer manage itself.
    -- Github link: https://github.com/wbthomason/packer.nvim
    use { "wbthomason/packer.nvim", commit = "e4c2afb37d31e99b399425e102c58b091fbc16be" }

    -- Lua library for nvim
    -- All the lua functions I don't want to write twice, so the description says
    -- Github link: https://github.com/nvim-lua/plenary.nvim
    use { "nvim-lua/plenary.nvim", commit = "46e8bb9d3a852e0a2678be2d48179db545a9a39a" }
    
    -- Web devicons
    -- Adds file type icons to NVim plugins
    -- Github link: https://github.com/kyazdani42/nvim-web-devicons
    use { "kyazdani42/nvim-web-devicons", commit = "2d02a56189e2bde11edd4712fea16f08a6656944" }

    ------------------------------------------------------------------------------------------
    -- GUI
    ------------------------------------------------------------------------------------------

    -- Onedarker colorscheme
    -- Onedark inspired colorscheme written in lua
    -- Github link: https://github.com/lunarvim/onedarker
    use { "lunarvim/onedarker", commit = "724aa3ab5efbdfe83ae0ea1ad9d44166b1685ba8" }

    ------------------------------------------------------------------------------------------
    -- Accesibility
    ------------------------------------------------------------------------------------------
    
    -- Alpha
    -- Alpha is a fast and fully customizable greeter for neovim
    -- Github link: https://github.com/goolord/alpha-nvim
    use {
        "goolord/alpha-nvim",
        requires = { {"kyazdani42/nvim-web-devicons"} },
        commit = "411ce27d871f963256c0787bc4133cf945dd89d3"
    }

    -- Telescope
    -- Find, Filter, Preview, Pick. All lua, all the time
    -- Github link: https://github.com/nvim-telescope/telescope.nvim
    use {
        "nvim-telescope/telescope.nvim",
        requires = { {"nvim-lua/plenary.nvim"} },
        commit = "524c4eb7fb1a9941460ab7c7c09a3bca9cebb7be"
    }

    -- Nvim tree explorer
    -- Github link: https://github.com/kyazdani42/nvim-tree.lua
    use {
        "kyazdani42/nvim-tree.lua",
        requires = {
            "kyazdani42/nvim-web-devicons",
        },
        commit = "c037c7ae848873756926d0085ae3bb8df9a99e9e"
    }

    -- toggleterm.nvim
    -- A neovim lua plugin to help easily manage multiple terminal windows
    -- Github link: https://github.com/akinsho/toggleterm.nvim
    use {
        "akinsho/toggleterm.nvim",
        config = function() require("toggleterm").setup() end,
        commit = "8cba5c20c9d8517af21ac9e2afd06ad7b2dbdece"
    }

    ------------------------------------------------------------------------------------------
    -- Project management & Version control
    ------------------------------------------------------------------------------------------

    -- project.nvim
    -- Superior project management solution for neovim.
    -- Github link: https://github.com/ahmedkhalf/project.nvim
    use { "ahmedkhalf/project.nvim", commit = "541115e762764bc44d7d3bf501b6e367842d3d4f"}

    -- gitsigns.nvim
    -- Github link: https://github.com/lewis6991/gitsigns.nvim
    use { "lewis6991/gitsigns.nvim", commit = "4883988cf8b623f63cc8c7d3f11b18b7e81f06ff" }

    ------------------------------------------------------------------------------------------
    -- Code management 
    ------------------------------------------------------------------------------------------

    -- Code style

    -- nvim-treesitter
    -- Treesitter configurations and abstraction layer
    -- Github link: https://github.com/nvim-treesitter/nvim-treesitter/commits/master
    use {
        "nvim-treesitter/nvim-treesitter",
        commit = "2f340af1357b0bae96b70b8969669000c5e6fe46"
    }

    -- Comment.nvim
    -- Intelligent comments
    -- Github links:
    use { "numToStr/Comment.nvim", commit = "2c26a00f32b190390b664e56e32fd5347613b9e2" }
    
    -- nvim-ts-context-commentstring
    -- Github links:
    use { "JoosepAlviste/nvim-ts-context-commentstring", commit = "88343753dbe81c227a1c1fd2c8d764afb8d36269" }

    -- indent-blankline.nvim
    -- Identation guides for neovim
    -- Github links: lukas-reineke/indent-blankline.nvim
    use { "lukas-reineke/indent-blankline.nvim", commit = "4a58fe6e9854ccfe6c6b0f59abb7cb8301e23025" } 

    ---------------------------------------------------------------------------

    -- Code completion

    -- nvim-cmp
    -- The completion plugin
    -- Github link:
    use { "hrsh7th/nvim-cmp", commit = "" }

    -- cmp-nvim-lua
    -- This source will complete neovim's Lua runtime API such vim.lsp.*.
    -- Github link: https://github.com/hrsh7th/cmp-nvim-lua
    use { "hrsh7th/cmp-nvim-lua", commit = "" }

    -- cmp-buffer
    -- Buffer completions
    -- Github link:
    use { "hrsh7th/cmp-buffer", commit = "" }

    -- cmp-path
    -- Path completions
    -- Github link:
    use { "hrsh7th/cmp-path", commit = "" }

    -- nvim-autopairs
    -- Get autopairs completion working
    -- Github link: https://github.com/windwp/nvim-autopairs
    use { "windwp/nvim-autopairs", commit = "" }
    
    ---------------------------------------------------------------------------

    -- Code snypptis

    -- LuaSnip
    -- Snippet completions engine
    -- Github link:
    use { "L3MON4D3/LuaSnip", commit = "" }
    
    -- friendly-snippets
    -- Github link:
    use { "rafamadriz/friendly-snippets", commit = "" }
    
    -- cmp_luasnip
    -- Github link:
    use { "saadparwaiz1/cmp_luasnip", commit = "" }

    ---------------------------------------------------------------------------
    
    -- Language server protocol

    -- nvim-lspconfig
    -- Enable LSP
    -- Github link:
    use { "neovim/nvim-lspconfig", commit = "" }

    -- nvim-lsp-installer
    -- Simple to use language server installer
    -- Github link:
    use { "williamboman/nvim-lsp-installer", commit = "" }

    -- null-ls
    -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
    -- Github link: https://github.com/jose-elias-alvarez/null-ls.nvim
    use { "jose-elias-alvarez/null-ls.nvim", commit = ""}

    -- cmp-nvim-lsp
    -- nvim-cmp source for neovim's built-in language server client.
    -- Github link: https://github.com/hrsh7th/cmp-nvim-lsp
    use { "hrsh7th/cmp-nvim-lsp", commit = "" }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins.
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
