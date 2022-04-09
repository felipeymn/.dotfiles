local o = vim.opt
local g = vim.g

g.mapleader = ' '

-- Appearance
g.everforest_background = 'hard'
g.everforest_better_performance = 1
o.background= 'dark'
o.cmdheight = 2
o.colorcolumn = '80'
o.cursorline = true
o.hidden = true
o.number = true
o.pumheight = 10         -- popup menu height
o.relativenumber = true
o.scrolloff = 8
o.showmode = false
o.signcolumn = 'yes'
o.termguicolors = true
o.wrap = false

-- Backups
o.backup = false
o.swapfile = false
o.writebackup = false

-- General
o.clipboard = 'unnamedplus'
o.errorbells = false
o.mouse = 'a'
o.shell = '/bin/bash'
o.splitbelow = true
o.splitright = true
o.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
o.undofile = true   -- persistent undo
o.updatetime = 300  -- faster completion (4000ms default)

-- Indentation
o.expandtab = true
o.shiftwidth = 2
o.softtabstop = 2
o.tabstop = 2

-- Search
o.hlsearch = true
o.inccommand = 'nosplit'
o.ignorecase = true
o.smartcase =  true
o.wildignore = { '.git/*', 'node_modules/*' }
o.wildignorecase = true

-- Code completion
o.completeopt = 'menu,menuone,noselect'

-- Disable builtin plugins
local disabled_built_ins = {
   "2html_plugin",
   "getscript",
   "getscriptPlugin",
   "gzip",
   "logipat",
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "matchit",
   "tar",
   "tarPlugin",
   "rrhelper",
   "spellfile_plugin",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
   g["loaded_" .. plugin] = 1
end
