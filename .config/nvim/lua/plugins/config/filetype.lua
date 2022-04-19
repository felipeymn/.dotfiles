local function config()
  local filetype = safe_require 'filetype'
  if not filetype then
    return
  end

  filetype.setup{}
end

return function()
  local filetype = {
    'nathom/filetype.nvim',
    config = config
  }
  return filetype
end
