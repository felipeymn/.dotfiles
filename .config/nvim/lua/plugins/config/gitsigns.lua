local function config()
  local gitsigns = safe_require 'gitsigns'
  if not gitsigns then
    return
  end

  gitsigns.setup {
    current_line_blame = true,
    on_attach = function(bufnr)
      set_gitsigns()
    end,
  }
end

return function()
  local gitsigns = {
    'lewis6991/gitsigns.nvim',
    setup = function()
      packer_lazy_load 'gitsigns.nvim'
    end,
    config = config
  }
  return gitsigns
end
