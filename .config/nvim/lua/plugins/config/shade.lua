return function()
  local shade = safe_require 'shade'
  if not shade then
    return
  end

  shade.setup ({
  overlay_opacity = 50,
  opacity_step = 1,
  keys = {
    toggle = '<Leader>s',
  }
})
end
