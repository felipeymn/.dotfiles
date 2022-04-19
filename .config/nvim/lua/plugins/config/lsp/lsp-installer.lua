local function config()
  local lsp_installer = safe_require 'nvim-lsp-installer'
  if not lsp_installer then
    return
  end

  lsp_installer.on_server_ready(function(server)
    local opts = {
      on_attach = require("plugins.config.lsp.handlers").on_attach,
      capabilities = require("plugins.config.lsp.handlers").capabilities,
    }
    server:setup(opts)
  end)
end

return function()
  local lsp_installer = {
    'williamboman/nvim-lsp-installer',
    config = config
  }
  return lsp_installer
end
