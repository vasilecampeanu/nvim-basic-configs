-- Map vim.fn to fn.
local fn = vim.fn

-- Automatically install packer.
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

-- Autocommand that reloads neovim whenever you save the plugins.lua file.
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on first use.
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
    -- Packer
    -- Github link: https://github.com/wbthomason/packer.nvim
    -- Have packer manage itself.
    use { "wbthomason/packer.nvim", commit = "e4c2afb37d31e99b399425e102c58b091fbc16be" }

    -- Onedarker colorscheme
    -- Github link: https://github.com/lunarvim/onedarker
    -- Onedark inspired colorscheme written in lua.
    use { "lunarvim/onedarker", commit = "724aa3ab5efbdfe83ae0ea1ad9d44166b1685ba8" }

    -- Web devicons
    -- Github link: https://github.com/kyazdani42/nvim-web-devicons
    -- Adds file type icons to NVim plugins.
    use { "kyazdani42/nvim-web-devicons", commit = "2d02a56189e2bde11edd4712fea16f08a6656944" }

    -- Alpha
    -- Github link: https://github.com/goolord/alpha-nvim
    -- Alpha is a fast and fully customizable greeter for neovim.
    use {
        "goolord/alpha-nvim",
        requires = { {"kyazdani42/nvim-web-devicons"} },
        commit = "411ce27d871f963256c0787bc4133cf945dd89d3"
    }

    -- Lua library for nvim
    -- Github link: https://github.com/nvim-lua/plenary.nvim
    -- All the lua functions I don't want to write twice, so the description says.
    use { "nvim-lua/plenary.nvim", commit = "46e8bb9d3a852e0a2678be2d48179db545a9a39a" }

    -- Telescope
    -- Github link: https://github.com/nvim-telescope/telescope.nvim
    -- Find, Filter, Preview, Pick. All lua, all the time.
    use {
        "nvim-telescope/telescope.nvim",
        requires = { {"nvim-lua/plenary.nvim"} },
        commit = "524c4eb7fb1a9941460ab7c7c09a3bca9cebb7be"
    }

    -- Project mangament with project.nvim
    -- Github link: https://github.com/ahmedkhalf/project.nvim
    -- Superior project management solution for neovim.
    use { "ahmedkhalf/project.nvim", commit = "541115e762764bc44d7d3bf501b6e367842d3d4f"}

    -- Nvim tree explorer
    -- Github link: https://github.com/kyazdani42/nvim-tree.lua
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
          'kyazdani42/nvim-web-devicons',
        },
        commit = "c037c7ae848873756926d0085ae3bb8df9a99e9e"
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins.
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
