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
	 if server.name == "sumneko_lua" then
	 	local sumneko_opts = require("plugins.config.lsp.settings.sumneko_lua")
	 	opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	 end

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
