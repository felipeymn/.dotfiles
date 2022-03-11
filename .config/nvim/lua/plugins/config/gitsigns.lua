return function()
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
