return function ()
  local bufferline = {
    'akinsho/bufferline.nvim',
    after = 'nvim-web-devicons',
    config = require 'bufferline'.setup()
  }
  return bufferline
end


