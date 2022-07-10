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
    use { "nvim-lua/plenary.nvim", commit = "986ad71ae930c7d96e812734540511b4ca838aa2" }
    
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
        commit = "10a3310546284faae4ada397a61d68e0a8d0d9f7"
    }

    -- Nvim tree explorer
    -- Github link: https://github.com/kyazdani42/nvim-tree.lua
    use {
        "kyazdani42/nvim-tree.lua",
        requires = {
            "kyazdani42/nvim-web-devicons",
        },
        commit = "ad1f3ef3bc86ca43ebf488569aadf6f56e448575"
    }

    -- toggleterm.nvim
    -- A neovim lua plugin to help easily manage multiple terminal windows
    -- Github link: https://github.com/akinsho/toggleterm.nvim
    use {
        "akinsho/toggleterm.nvim",
        config = function() require("toggleterm").setup() end,
        commit = "1a8b330d3da8b5ee3d726cdc1797ac83ef84b695"
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
        commit = "6f1bf2feec45ff7c9d7844602fe175907b7db633"
    }

    -- Comment.nvim
    -- Intelligent comments
    -- Github links:
    use { "numToStr/Comment.nvim", commit = "4086630ce2aaf76b2652516ee3169f0b558f6be1" }
    
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
    use { "hrsh7th/nvim-cmp", commit = "9897465a7663997b7b42372164ffc3635321a2fe" }

    -- cmp-nvim-lua
    -- This source will complete neovim's Lua runtime API such vim.lsp.*.
    -- Github link: https://github.com/hrsh7th/cmp-nvim-lua
    use { "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }

    -- cmp-buffer
    -- Buffer completions
    -- Github link:
    use { "hrsh7th/cmp-buffer", commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323" }

    -- cmp-path
    -- Path completions
    -- Github link:
    use { "hrsh7th/cmp-path", commit = "981baf9525257ac3269e1b6701e376d6fbff6921" }

    -- nvim-autopairs
    -- Get autopairs completion working
    -- Github link: https://github.com/windwp/nvim-autopairs
    use { "windwp/nvim-autopairs", commit = "972a7977e759733dd6721af7bcda7a67e40c010e" }
    
    ---------------------------------------------------------------------------

    -- Code snypptis

    -- LuaSnip
    -- Snippet completions engine
    -- Github link:
    use { "L3MON4D3/LuaSnip", commit = "7d78278c2a935b8cd1b6b43065223e14490f3133" }
    
    -- friendly-snippets
    -- Github link:
    use { "rafamadriz/friendly-snippets", commit = "24afb4c178d8ea28bfa73f37814ada43be478b1d" }
    
    -- cmp_luasnip
    -- Github link:
    use { "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" }

    ---------------------------------------------------------------------------
    
    -- Language server protocol

    -- nvim-lspconfig
    -- Enable LSP
    -- Github link:
    use { "neovim/nvim-lspconfig", commit = "41a826947eefbc7b59cc80cef405cce9ea6d82b8" }

    -- nvim-lsp-installer
    -- Simple to use language server installer
    -- Github link:
    use { "williamboman/nvim-lsp-installer", commit = "33700e2de88699caa064e94e9642f244b26ac014" }

    -- null-ls
    -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
    -- Github link: https://github.com/jose-elias-alvarez/null-ls.nvim
    use { "jose-elias-alvarez/null-ls.nvim", commit = "fbb1929b29beff82e0fc495670f00ef4b3bcbcd3"}

    -- cmp-nvim-lsp
    -- nvim-cmp source for neovim's built-in language server client.
    -- Github link: https://github.com/hrsh7th/cmp-nvim-lsp
    use { "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins.
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
