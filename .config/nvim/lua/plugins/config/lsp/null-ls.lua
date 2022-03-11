local M = {}

M.setup = function()
  local null_ls = safe_require 'null-ls'
  if not null_ls then
    return
  end

  local format = null_ls.builtins.formatting

  null_ls.setup {
    sources = {
      format.prettierd,
    },
  }
end

function M.enable_format_on_save()
  vim.cmd [[
    augroup format_on_save
      au!
      au BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 2000)
    augroup end
  ]]
end

return M
