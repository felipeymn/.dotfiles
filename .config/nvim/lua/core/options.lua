local o = vim.opt
local g = vim.g

g.mapleader = ' '
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
o.cursorline = true
o.showmode = false
-- Backups
o.backup = false
o.writebackup = false
o.swapfile = false

-- General
o.errorbells = false
o.mouse = 'a'
o.shell = '/bin/bash'
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
-- Code completion
o.completeopt = 'menu,menuone,noselect'
