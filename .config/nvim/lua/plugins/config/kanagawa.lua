return function()
  local kanagawa = safe_require 'kanagawa'
  local kanagawa_colors = safe_require 'kanagawa.colors'
  if not kanagawa or not kanagawa_colors then
    return
  end

  local palette = kanagawa_colors.setup()
  -- local overrides = {
    -- NvimTreeNormal = { bg = palette.bg_dark },
    -- ColorColumn = { bg = palette.bg_menu }
  -- }
  -- kanagawa.setup({ overrides = overrides })
  kanagawa.setup()
  -- vim.cmd('colorscheme kanagawa')
end
