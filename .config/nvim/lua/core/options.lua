local o = vim.opt
local g = vim.g

-- Appearance
o.number = true
o.signcolumn = 'yes'
o.wrap = false
o.hlsearch = false
o.hidden = true
o.scrolloff = 8
o.termguicolors = true
o.relativenumber = true
o.colorcolumn = '80'

-- Backups
o.backup = false
o.writebackup = false
o.swapfile = false

-- General
o.errorbells = false

-- Indentation
o.expandtab = true
o.shiftwidth = 2
o.softtabstop = 2
o.tabstop = 2

-- Search
o.inccommand = 'nosplit'
o.ignorecase = true
o.smartcase =  true
o.wildignore = { '.git/*', 'node_modules/*' }
o.wildignorecase = true

-- Disable builtin plugins
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_zipPlugin = 1
g.loaded_zip = 1

-- Code completion
o.completeopt = 'menu,menuone,noselect'
