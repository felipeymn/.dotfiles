
return function()
  local shade = {
    'sunjon/shade.nvim',
    config = function()
      local plugin = safe_require 'shade'
      if not plugin then
        return
      end

      plugin.setup ({
        overlay_opacity = 50,
        opacity_step = 1,
        keys = {
          toggle = '<Leader>s'
        }
      })
    end
  }
  return shade
end
