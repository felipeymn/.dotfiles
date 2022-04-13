local function config()
  local treesitter = safe_require 'nvim-treesitter.configs'
  if not treesitter then
    return
  end

  treesitter.setup {
    highlight = {
      enable = true, -- false will disable the whole extension
    },
  }
end

return function()
  local treesitter = {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufRead',
    config = config
  }
  return treesitter
end
