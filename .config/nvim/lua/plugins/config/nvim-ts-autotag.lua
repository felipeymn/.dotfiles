return function()
  local nvim_ts_autotag = safe_require 'nvim-ts-autotag'
  if not nvim_ts_autotag then
    return
  end

  nvim_ts_autotag.setup()
end
