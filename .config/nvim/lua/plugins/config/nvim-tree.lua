return function()
  local nvim_tree = safe_require 'nvim-tree'
  if not nvim_tree then
    return
  end
  local map = require('nvim-tree.config').nvim_tree_callback

  vim.g.nvim_tree_indent_markers = 0
  nvim_tree.setup {}
end
