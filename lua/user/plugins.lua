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
    -- Github link: https://github.com/wbthomason/packer.nvim
    -- Have packer manage itself.
    use { "wbthomason/packer.nvim", commit = "e4c2afb37d31e99b399425e102c58b091fbc16be" }

    -- Impatient
    -- Github link: https://github.com/lewis6991/impatient.nvim
    -- Improve startup time for Neovim
    use { 'lewis6991/impatient.nvim', commit = "2aa872de40dbbebe8e2d3a0b8c5651b81fe8b235" }

    -- Lua library for nvim
    -- Github link: https://github.com/nvim-lua/plenary.nvim
    -- All the lua functions I don't want to write twice, so the description says
    use { "nvim-lua/plenary.nvim", commit = "46e8bb9d3a852e0a2678be2d48179db545a9a39a" }
    
    -- Fix CursorHold Performance
    -- Github link: https://github.com/antoinemadec/FixCursorHold.nvim
    use { "antoinemadec/FixCursorHold.nvim", commit = "5aa5ff18da3cdc306bb724cf1a138533768c9f5e" }

    -- Web devicons
    -- Github link: https://github.com/kyazdani42/nvim-web-devicons
    -- Adds file type icons to NVim plugins
    use { "kyazdani42/nvim-web-devicons", commit = "2d02a56189e2bde11edd4712fea16f08a6656944" }

    -- Plugin used as a dependency by other plugins
    -- Github link: https://github.com/nvim-lua/popup.nvim
    use { "nvim-lua/popup.nvim", commit = "b7404d35d5d3548a82149238289fa71f7f6de4ac" }

    ------------------------------------------------------------------------------------------
    -- GUI
    ------------------------------------------------------------------------------------------

    -- Onedarker colorscheme
    -- Github link: https://github.com/lunarvim/onedarker
    -- Onedark inspired colorscheme written in lua
    use { "lunarvim/onedarker", commit = "724aa3ab5efbdfe83ae0ea1ad9d44166b1685ba8" }

    -- Identation guides for neovim
    -- Github links: lukas-reineke/indent-blankline.nvim
    use { "lukas-reineke/indent-blankline.nvim", commit = "4a58fe6e9854ccfe6c6b0f59abb7cb8301e23025" } 

    ------------------------------------------------------------------------------------------
    -- Accesibility
    ------------------------------------------------------------------------------------------
    
    -- Alpha
    -- Github link: https://github.com/goolord/alpha-nvim
    -- Alpha is a fast and fully customizable greeter for neovim
    use {
        "goolord/alpha-nvim",
        requires = { {"kyazdani42/nvim-web-devicons"} },
        commit = "411ce27d871f963256c0787bc4133cf945dd89d3"
    }

    -- Telescope
    -- Github link: https://github.com/nvim-telescope/telescope.nvim
    -- Find, Filter, Preview, Pick. All lua, all the time
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

    -- Toggle term
    -- Github link: https://github.com/akinsho/toggleterm.nvim
    -- A neovim lua plugin to help easily manage multiple terminal windows
    use {
        "akinsho/toggleterm.nvim",
        config = function() require("toggleterm").setup() end,
        commit = "8cba5c20c9d8517af21ac9e2afd06ad7b2dbdece"
    }

    ------------------------------------------------------------------------------------------
    -- Project management & Version control
    ------------------------------------------------------------------------------------------
    
    -- Project.nvim
    -- Github link: https://github.com/ahmedkhalf/project.nvim
    -- Superior project management solution for neovim.
    use { "ahmedkhalf/project.nvim", commit = "541115e762764bc44d7d3bf501b6e367842d3d4f"}
    
    -- Git signs
    -- Github link: https://github.com/lewis6991/gitsigns.nvim
    use { "lewis6991/gitsigns.nvim", commit = "4883988cf8b623f63cc8c7d3f11b18b7e81f06ff" }

    -- Git diff view
    -- Github Links: https://github.com/sindrets/diffview.nvim
    -- Single tabpage interface for easily cycling through diffs for all modified files for any git rev
    use { 
        "sindrets/diffview.nvim", 
        requires = "nvim-lua/plenary.nvim", 
        commit = "16c3985581ee65bccdfbebbe014b24a01adc7d1f"
    }
 
    ------------------------------------------------------------------------------------------
    -- Code management 
    ------------------------------------------------------------------------------------------

    -- The completion plugin
    use "hrsh7th/nvim-cmp" 

    -- Buffer completions
    use "hrsh7th/cmp-buffer"

    -- Path completions
    use "hrsh7th/cmp-path"

    -- Cmdline completions
    use "hrsh7th/cmp-cmdline" 
    
    -- Snippet completions
    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"
    use "saadparwaiz1/cmp_luasnip"

    -- Treesitter configurations and abstraction layer
    -- Github link: https://github.com/nvim-treesitter/nvim-treesitter/commits/master
    use {
        "nvim-treesitter/nvim-treesitter",
        commit = "2f340af1357b0bae96b70b8969669000c5e6fe46"
    }
    
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins.
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
