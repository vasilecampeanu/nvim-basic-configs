------------------------------------------------------------------------------------------
-- General
------------------------------------------------------------------------------------------

-- User's plugin management
require "user.plugins"

-- NVim options
require "user.options"

-- Keymaps
require "user.keymaps"


------------------------------------------------------------------------------------------
-- GUI
------------------------------------------------------------------------------------------

-- Set NVim colorscheme
require "user.colorscheme"


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
-- User custom configs
------------------------------------------------------------------------------------------

-- Put this at the end of the main configuration list.
require "user.custom"
