local set = function(mode, key, result)
  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    {noremap = true, silent = true}
  )
end

-- Disable arrow keys
set('n', '<up>', '<nop>')
set('n', '<down>', '<nop>')
set('n', '<left>', '<nop>')
set('n', '<right>', '<nop>')

set('i', '<up>', '<nop>')
set('i', '<down>', '<nop>')
set('i', '<left>', '<nop>')
set('i', '<right>', '<nop>')

-- Alternative esc
set('i', 'jj', '<ESC>')
set('i', 'JJ', '<ESC>')

-- Telescope shortcuts
set('n', 'ff', ':Telescope find_files<cr>')
set('n', 'fg', ':Telescope live_grep<cr>')
set('n', 'fb', ':Telescope buffers<cr>')
set('n', 'fh', ':Telescope help_tags<cr>')

-- Lsp
set('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<cr>')
set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
set('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<cr>')

-- Tree Explorer
set('n', '<c-b>', ':NvimTreeToggle<cr>')
