-- Option table
local options = {
    backup = false,                          -- creates a backup file
    clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
    cmdheight = 1,                           -- more space in the neovim command line for displaying messages
    completeopt = { "menuone", "noselect" }, -- mostly just for cmp
    conceallevel = 0,                        -- so that `` is visible in markdown files
    cursorline = true,                       -- highlight the current line
    expandtab = true,                        -- convert tabs to spaces
    fileencoding = "utf-8",                  -- the encoding written to a file
    guifont = "monospace:h17",               -- the font used in graphical neovim applications
    hlsearch = true,                         -- highlight all matches on previous search pattern
    ignorecase = true,                       -- ignore case in search patterns
    number = true,                           -- set numbered lines
    numberwidth = 4,                         -- set number column width to 4 {default 4}
    pumheight = 10,                          -- pop up menu height
    relativenumber = true,                   -- set relative numbered lines
    scrolloff = 8,                           -- is one of my fav
    shiftwidth = 4,                          -- the number of spaces inserted for each indentation
    showmode = true,                         -- we don't need to see things like -- INSERT -- anymore
    showtabline = 0,                         -- always show tabs
    sidescrolloff = 8,                       -- the minimal number of screen columns to keep to the left and to the right of the cursor if 'nowrap' is set
    signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
    smartcase = true,                        -- smart case
    smartindent = true,                      -- make indenting smarter again
    splitbelow = true,                       -- force all horizontal splits to go below current window
    splitright = true,                       -- force all vertical splits to go to the right of current window
    swapfile = false,                        -- creates a swapfile
    tabstop = 4,                             -- insert 2 spaces for a tab
    termguicolors = true,                    -- set term gui colors (most terminals support this)
    timeoutlen = 500,                        -- time to wait for a mapped sequence to complete (in milliseconds)
    undofile = true,                         -- enable persistent undo
    updatetime = 300,                        -- faster completion (4000ms default)
    wrap = false,                            -- display lines as one long line
    writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- Options using vim style
vim.cmd [[set guicursor=i:block]]
vim.cmd [[set guicursor=a:blinkon1]]