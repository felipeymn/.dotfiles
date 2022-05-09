local function config()
  local nvim_tree = safe_require 'nvim-tree'
  if not nvim_tree then
    return
  end
  local map = require('nvim-tree.config').nvim_tree_callback

  nvim_tree.setup {
    disable_netrw = true,
    ignore_ft_on_setup = { 'dashboard' },
  }
end

return function()
  local nvim_tree = {
    'kyazdani42/nvim-tree.lua',
    after = 'nvim-web-devicons',
    cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
    config = config
  }
  return nvim_tree
end
