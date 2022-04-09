return function()
  local bufferline = safe_require 'bufferline'
  if not bufferline then
    return
  end


bufferline.setup()
end
