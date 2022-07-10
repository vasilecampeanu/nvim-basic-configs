# `nvim-nyx-ide`

# Disclaimer
Created and tested on MacBook Air M1 with macOS Monterey 12.4.

# Installing neovim from source

## Dependencies
Make sure you have automake installed on your system.
```bash
brew install automake
```
## Installation steps
Clone [neovim repo](https://github.com/neovim/neovim.git).
```bash
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout v0.7.2
```

Build neovim.
```bash
make CMAKE_BUILD_TYPE=Release
sudo make install
```

# Install `nvim-nyx-ide`
```bash
git clone https://github.com/vasilecampeanu/nvim-nyx-ide.git ~/.config/nvim
```

# Plugins

## IDE Dependencies

- [packer](https://github.com/wbthomason/packer.nvim)
- [plenary](https://github.com/nvim-lua/plenary.nvim)
- [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)

## Graphical User Interface

- [onedarker](https://github.com/lunarvim/onedarker)

## Accesibility

- [alpha-nvim](https://github.com/goolord/alpha-nvim)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua)
- [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)

## Project management & Version control

- [project.nvim](https://github.com/ahmedkhalf/project.nvim)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)

## Code management
### Code style

- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [Comment.nvim](https://github.com/numToStr/Comment.nvim)
- [nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring)
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)

### Code completion

- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua)
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
- [cmp-path](https://github.com/hrsh7th/cmp-path)
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)

### Code snypptis

- [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)
- [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)

### Language server protocol

- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer)
- [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim)
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
