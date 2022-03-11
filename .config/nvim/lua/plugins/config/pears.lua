return function()
  local pears = safe_require 'pears'
  if not pears then
    return
  end

  pears.setup()
end
