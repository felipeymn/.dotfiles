local function config()
  local bufferline = safe_require 'bufferline'
  if not bufferline then
    return
  end
  bufferline.setup()
end

return function ()
  local bufferline = {
    'akinsho/bufferline.nvim',
    after = 'nvim-web-devicons',
    config = config 
  }
  return bufferline
end


