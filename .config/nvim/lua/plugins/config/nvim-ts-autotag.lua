return function()
  local nvim_ts_autotag = {
    'windwp/nvim-ts-autotag',
    config = require 'nvim-ts-autotag'.setup()
  }
  return nvim_ts_autotag
end
