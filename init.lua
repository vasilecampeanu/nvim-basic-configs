------------------------------------------------------------------------------------------
-- General
------------------------------------------------------------------------------------------

-- User's plugin management
require "user.plugins"

-- Impatient
require "user.impatient"

-- NVim options
require "user.options"

-- Keymaps
require "user.keymaps"

------------------------------------------------------------------------------------------
-- GUI
------------------------------------------------------------------------------------------

-- Set NVim colorscheme
require "user.colorscheme"

-- Set NVim colorscheme
require "user.identline"

------------------------------------------------------------------------------------------
-- Accesibility
------------------------------------------------------------------------------------------

-- Home page customization using alpha
require "user.alpha"

-- File finder and explorer
require "user.telescope"

-- NVim tree explorer config
require "user.nvim-tree"

-- Toggle term config file
require "user.toggleterm"

------------------------------------------------------------------------------------------
-- Project management & Version control
------------------------------------------------------------------------------------------

-- Project manager configuration
require "user.project"

-- Configure git signs
require "user.gitsigns"

------------------------------------------------------------------------------------------
-- Code management
------------------------------------------------------------------------------------------
require "user.treesitter"

------------------------------------------------------------------------------------------
-- User custom configs
------------------------------------------------------------------------------------------
require "user.cmp"

-- Put this at the end of the main configuration list.
require "user.custom"
