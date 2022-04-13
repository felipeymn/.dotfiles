local function config()
  local nvim_web_devicons = safe_require 'nvim-web-devicons'
  if not nvim_web_devicons then
    return
  end

  nvim_web_devicons.setup()
end

return function()
  local nvim_web_devicons = {
    'kyazdani42/nvim-web-devicons',
    config = config
  }
  return nvim_web_devicons
end

