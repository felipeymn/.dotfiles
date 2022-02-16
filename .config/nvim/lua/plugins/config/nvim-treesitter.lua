return function()
  local treesitter = safe_require 'nvim-treesitter.configs'
  if not treesitter then
    return
  end

  treesitter.setup {
    ensure_installed = 'maintained',
    highlight = {
      enable = true, -- false will disable the whole extension
    },
  }

end
