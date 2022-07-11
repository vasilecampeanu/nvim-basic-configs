------------------------------------------------------------------------------------------
-- Core
------------------------------------------------------------------------------------------

require("user.core")

------------------------------------------------------------------------------------------
-- Plugins
------------------------------------------------------------------------------------------

require("user.plugins")

------------------------------------------------------------------------------------------
-- Accesibility
------------------------------------------------------------------------------------------

-- Home page customization using alpha
require("user.alpha")

-- File finder and explorer
require("user.telescope")

-- NVim tree explorer config
require("user.nvim-tree")

-- Toggle term config file
require("user.toggleterm")

------------------------------------------------------------------------------------------
-- Project management & Version control
------------------------------------------------------------------------------------------

-- Project manager configuration
require("user.project")

-- Configure git signs
require("user.gitsigns")

------------------------------------------------------------------------------------------
-- Code management
------------------------------------------------------------------------------------------
require("user.treesitter")
require("user.comment")
require("user.cmp")
require("user.autopairs")
require("user.lsp")
