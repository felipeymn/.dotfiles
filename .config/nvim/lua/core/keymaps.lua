local opts = { noremap = true, silent = true }
local set = function(mode, key, result)
  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    opts
  )
end

local buf_set = function(key, result)
  vim.api.nvim_buf_set_keymap(0, 'n', key, result .. '<cr>', opts)
end

-- Alternative esc
set('i', 'jj', '<ESC>')
set('i', 'JJ', '<ESC>')

-- Disable arrow keys
set('i', '<up>', '<nop>')
set('i', '<down>', '<nop>')
set('i', '<left>', '<nop>')
set('i', '<right>', '<nop>')

set('n', '<up>', '<nop>')
set('n', '<down>', '<nop>')
set('n', '<left>', '<nop>')
set('n', '<right>', '<nop>')

-- Better window navigation
set('n', '<c-h>', '<c-w>h')
set('n', '<c-j>', '<c-w>j')
set('n', '<c-k>', '<c-w>k')
set('n', '<c-l>', '<c-w>l')

-- Window resize
set('n', '<c-up>', ':resize -2<cr>')
set('n', '<c-down>', ':resize +2<cr>')
set('n', '<c-left>', ':vertical resize -2<cr>')
set('n', '<c-right>', ':vertical resize +2<cr>')

-- Telescope shortcuts
set('n', '<leader>ff', ':Telescope find_files<cr>')
set('n', '<leader>fg', ':Telescope live_grep<cr>')
set('n', '<leader>fb', ':Telescope buffers<cr>')
set('n', '<leader>fh', ':Telescope help_tags<cr>')

-- Lsp
-- set('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<cr>')
-- set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
-- set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
-- set('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<cr>')

-- Tree Explorer
set('n', '<leader>e', ':NvimTreeToggle<cr>')

-- Move lines up and down
set('n', '<a-j>', ':m .+1<cr>==')
set('n', '<a-k>', ':m .-2<cr>==')
set('v', '<a-j>', ":m '>+1<cr>gv=gv")
set('v', '<a-k>', ":m '<-2<cr>gv=gv")

set_lsp = function()
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  buf_set('gD', '<cmd>lua vim.lsp.buf.declaration()')
  buf_set('gd', '<cmd>lua vim.lsp.buf.definition()')
  buf_set('K', '<cmd>lua vim.lsp.buf.hover()')
  buf_set('gi', '<cmd>lua vim.lsp.buf.implementation()')
  -- buf_set('<c-k>', '<cmd>lua vim.lsp.buf.signature_help()')
  -- buf_set('<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()')
  -- buf_set('<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()')
  -- buf_set('<leader>wl', 'print(<cmd>lua vim.inspect(vim.lsp.buf.list_workspace_folders()))')
  buf_set('<leader>D', '<cmd>lua vim.lsp.buf.type_definition()')
  buf_set('<leader>rn', '<cmd>lua vim.lsp.buf.rename()')
  buf_set('<leader>ca', '<cmd>lua vim.lsp.buf.code_action()')
  buf_set('gr', '<cmd>lua vim.lsp.buf.references()')
  -- buf_set('<leader>f', 'vim.lsp.buf.formatting()')
end

set_gitsigns = function ()
  buf_set('<leader>hs', ':Gitsigns stage_hunk') 
  buf_set('<leader>hu', ':Gitsigns undo_stage_hunk') 
  buf_set('<leader>hr', ':Gitsigns reset_hunk') 
  buf_set('<leader>hp', ':Gitsigns preview_hunk') 
end
