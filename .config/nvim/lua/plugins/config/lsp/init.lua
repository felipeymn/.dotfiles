local function config()
  local lspconfig = safe_require 'lspconfig'
  -- local cmp_nvim_lsp = safe_require 'cmp_nvim_lsp'
  -- if not lspconfig or not cmp_nvim_lsp then
  if not lspconfig then
    return
  end

  local handlers = require 'plugins.config.lsp.handlers'
  handlers.setup()
end
--
--   local null_ls = require 'plugins.config.lsp.null-ls'
--   null_ls.setup()
--null_ls.enable_format_on_save()
--
--   local on_attach = function(client, bufnr)
--     set_lsp() -- lsp keymaps
--     if client.name ~= 'null-ls' then
--       client.resolved_capabilities.document_formatting = false
--       client.resolved_capabilities.document_range_formatting = false
--     end
--   end
--
--   local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
--   for type, icon in pairs(signs) do
--     local hl = "DiagnosticSign" .. type
--     vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
--   end
--
--   local servers = { 'eslint', 'tsserver' }
--
--   local project_library_path = '/home/felipeymn/.asdf/installs/nodejs/17.7.2/.npm/lib/node_modules/@angular/language-server/home/felipeymn/.asdf/installs/nodejs/17.4.0/.npm/lib/node_modules'
--   local angularls_path = '/home/felipeymn/.asdf/installs/nodejs/17.7.2/.npm/lib/node_modules/@angular/language-server'
--   local cmd = {"node", angularls_path, "--stdio", "--tsProbeLocations", project_library_path , "--ngProbeLocations", project_library_path}
--
--   local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
--
--   for _, lsp in pairs(servers) do
--     lspconfig[lsp].setup {
--       on_attach = on_attach,
--       flags = {
--         -- This will be the default in neovim 0.7+
--         debounce_text_changes = 150,
--       },
--       capabilities = capabilities
--     }
--   end
--
--   lspconfig.angularls.setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--     cmd = cmd,
--     on_new_config = function(new_config, new_root_dir)
--       new_config.cmd = cmd
--     end,
--   }
-- end
--
-- return function()
--   local lsp = {
--     {
--       'jose-elias-alvarez/null-ls.nvim'
--     },
--     { -- Lsp
--       'neovim/nvim-lspconfig',
--       setup = function()
--         packer_lazy_load 'nvim-lspconfig'
--         -- reload the current file so lsp actually starts for it
--         vim.defer_fn(function()
--           vim.cmd 'if &ft == "packer" | echo "" | else | silent! e %'
--         end, 0)
--       end,
--       config = config
--     }
--   }
--   return lsp
-- end

return function()
  local lsp = {
    'neovim/nvim-lspconfig',
    config = config
  }
  return lsp
end
