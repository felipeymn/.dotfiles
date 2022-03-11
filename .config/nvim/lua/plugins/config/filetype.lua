return function()
  local filetype = safe_require 'filetype'
  if not filetype then
    return
  end

  filetype.setup {
  }
end
