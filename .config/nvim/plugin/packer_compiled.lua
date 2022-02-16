-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/felipeymn/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/felipeymn/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/felipeymn/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/felipeymn/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/felipeymn/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/felipeymn/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["kanagawa.nvim"] = {
    loaded = true,
    path = "/home/felipeymn/.local/share/nvim/site/pack/packer/start/kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nJ\0\0\4\0\3\0\n6\0\0\0'\2\1\0B\0\2\2\14\0\0\0X\1\1ÄK\0\1\0009\1\2\0004\3\0\0B\1\2\1K\0\1\0\nsetup\flualine\17safe_require\0" },
    loaded = true,
    path = "/home/felipeymn/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/felipeymn/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nR\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\21select_next_item\fvisibleR\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\21select_prev_item\fvisibleÄ\3\1\0\t\0\25\0/6\0\0\0'\2\1\0B\0\2\2\14\0\0\0X\1\1Ä2\0(Ä9\1\2\0005\3\6\0009\4\3\0009\4\4\0044\6\3\0005\a\5\0>\a\1\6B\4\2\2=\4\4\0035\4\t\0009\5\a\0009\5\b\5B\5\1\2=\5\n\0049\5\a\0009\5\v\0055\a\14\0009\b\f\0009\b\r\b=\b\15\aB\5\2\2=\5\16\0049\5\a\0009\5\17\5B\5\1\2=\5\18\0049\5\a\0003\a\19\0005\b\20\0B\5\3\2=\5\21\0049\5\a\0003\a\22\0005\b\23\0B\5\3\2=\5\24\4=\4\a\3B\1\2\0012\0\0ÄK\0\1\0K\0\1\0\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\14<C-Space>\rcomplete\t<CR>\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\1\0\0\nclose\fmapping\1\0\0\1\0\1\tname\rnvim_lsp\fsources\vconfig\nsetup\bcmp\17safe_require\0" },
    loaded = true,
    path = "/home/felipeymn/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/felipeymn/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n»\n\0\2\t\1&\0Ü\0016\2\0\0009\2\1\0029\2\2\2\18\4\1\0'\5\3\0'\6\4\0B\2\4\0016\2\0\0009\2\1\0029\2\5\2\18\4\1\0'\5\6\0'\6\a\0'\a\b\0-\b\0\0B\2\6\0016\2\0\0009\2\1\0029\2\5\2\18\4\1\0'\5\6\0'\6\t\0'\a\n\0-\b\0\0B\2\6\0016\2\0\0009\2\1\0029\2\5\2\18\4\1\0'\5\6\0'\6\v\0'\a\f\0-\b\0\0B\2\6\0016\2\0\0009\2\1\0029\2\5\2\18\4\1\0'\5\6\0'\6\r\0'\a\14\0-\b\0\0B\2\6\0016\2\0\0009\2\1\0029\2\5\2\18\4\1\0'\5\6\0'\6\15\0'\a\16\0-\b\0\0B\2\6\0016\2\0\0009\2\1\0029\2\5\2\18\4\1\0'\5\6\0'\6\17\0'\a\18\0-\b\0\0B\2\6\0016\2\0\0009\2\1\0029\2\5\2\18\4\1\0'\5\6\0'\6\19\0'\a\20\0-\b\0\0B\2\6\0016\2\0\0009\2\1\0029\2\5\2\18\4\1\0'\5\6\0'\6\21\0'\a\22\0-\b\0\0B\2\6\0016\2\0\0009\2\1\0029\2\5\2\18\4\1\0'\5\6\0'\6\23\0'\a\24\0-\b\0\0B\2\6\0016\2\0\0009\2\1\0029\2\5\2\18\4\1\0'\5\6\0'\6\25\0'\a\26\0-\b\0\0B\2\6\0016\2\0\0009\2\1\0029\2\5\2\18\4\1\0'\5\6\0'\6\27\0'\a\28\0-\b\0\0B\2\6\0016\2\0\0009\2\1\0029\2\5\2\18\4\1\0'\5\6\0'\6\29\0'\a\30\0-\b\0\0B\2\6\0016\2\0\0009\2\1\0029\2\5\2\18\4\1\0'\5\6\0'\6\31\0'\a \0-\b\0\0B\2\6\0019\2!\0\a\2\"\0X\2\6Ä9\2#\0+\3\1\0=\3$\0029\2#\0+\3\1\0=\3%\2K\0\1\0\3¿\30document_range_formatting\24document_formatting\26resolved_capabilities\fnull-ls\tname*<cmd>lua vim.lsp.buf.formatting()<CR>\r<space>f*<cmd>lua vim.lsp.buf.references()<CR>\agr+<cmd>lua vim.lsp.buf.code_action()<CR>\14<space>ca&<cmd>lua vim.lsp.buf.rename()<CR>\14<space>rn/<cmd>lua vim.lsp.buf.type_definition()<CR>\r<space>DJ<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>\14<space>wl7<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>\14<space>wr4<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>\14<space>wa.<cmd>lua vim.lsp.buf.signature_help()<CR>\n<C-k>.<cmd>lua vim.lsp.buf.implementation()<CR>\agi%<cmd>lua vim.lsp.buf.hover()<CR>\6K*<cmd>lua vim.lsp.buf.definition()<CR>\agd+<cmd>lua vim.lsp.buf.declaration()<CR>\agD\6n\24nvim_buf_set_keymap\27v:lua.vim.lsp.omnifunc\romnifunc\24nvim_buf_set_option\bapi\bvimÚ\4\1\0\17\0\29\0@6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\2\15\0\0\0X\2\2Ä\14\0\1\0X\2\1Ä2\0004Ä6\2\3\0'\4\4\0B\2\2\0029\3\5\2B\3\1\0019\3\6\2B\3\1\0015\3\a\0003\4\b\0005\5\t\0005\6\n\0006\a\v\0\18\t\6\0B\a\2\4H\n\fÄ'\f\f\0\18\r\n\0&\f\r\f6\r\r\0009\r\14\r9\r\15\r\18\15\f\0005\16\16\0=\v\17\16=\f\18\16=\f\19\16B\r\3\1F\n\3\3R\nÚ9\a\20\0016\t\r\0009\t\21\t9\t\22\t9\t\23\tB\t\1\0A\a\0\0026\b\v\0\18\n\5\0B\b\2\4H\v\bÄ8\r\f\0009\r\5\r5\15\24\0=\4\25\0155\16\26\0=\16\27\15=\a\28\15B\r\2\1F\v\3\3R\vˆ2\0\0ÄK\0\1\0K\0\1\0\17capabilities\nflags\1\0\1\26debounce_text_changes\3ñ\1\14on_attach\1\0\0\29make_client_capabilities\rprotocol\blsp\24update_capabilities\nnumhl\vtexthl\ttext\1\0\0\16sign_define\afn\bvim\19DiagnosticSign\npairs\1\0\4\nError\tÔôô \tHint\tÔ†µ \tWarn\tÔî© \tInfo\tÔëâ \1\3\0\0\veslint\rtsserver\0\1\0\2\fnoremap\2\vsilent\2\26enable_format_on_save\nsetup\31plugins.config.lsp.null-ls\frequire\17cmp_nvim_lsp\14lspconfig\17safe_require\0" },
    loaded = true,
    path = "/home/felipeymn/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n∑\1\0\0\5\0\t\0\0186\0\0\0'\2\1\0B\0\2\2\14\0\0\0X\1\1ÄK\0\1\0006\1\2\0'\3\3\0B\1\2\0029\1\4\0016\2\5\0009\2\6\2)\3\0\0=\3\a\0029\2\b\0004\4\0\0B\2\2\1K\0\1\0\nsetup\29nvim_tree_indent_markers\6g\bvim\23nvim_tree_callback\21nvim-tree.config\frequire\14nvim-tree\17safe_require\0" },
    loaded = true,
    path = "/home/felipeymn/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nñ\1\0\0\5\0\6\0\f6\0\0\0'\2\1\0B\0\2\2\14\0\0\0X\1\1ÄK\0\1\0009\1\2\0005\3\3\0005\4\4\0=\4\5\3B\1\2\1K\0\1\0\14highlight\1\0\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\17safe_require\0" },
    loaded = true,
    path = "/home/felipeymn/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\nP\0\0\3\0\3\0\t6\0\0\0'\2\1\0B\0\2\2\14\0\0\0X\1\1ÄK\0\1\0009\1\2\0B\1\1\1K\0\1\0\nsetup\22nvim-web-devicons\17safe_require\0" },
    loaded = true,
    path = "/home/felipeymn/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/felipeymn/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/felipeymn/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/felipeymn/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n‹\4\0\0\t\0\31\0(6\0\0\0'\2\1\0B\0\2\2\14\0\0\0X\1\1ÄK\0\1\0006\1\2\0'\3\3\0B\1\2\0029\2\4\0005\4\20\0005\5\5\0005\6\6\0=\6\a\0055\6\r\0005\a\t\0009\b\b\1=\b\n\a9\b\v\1=\b\f\a=\a\14\0065\a\16\0009\b\15\1=\b\17\a=\a\18\6=\6\19\5=\5\21\0045\5\23\0005\6\22\0=\6\24\5=\5\25\0045\5\27\0005\6\26\0=\6\28\5=\5\29\4B\2\2\0019\2\30\0'\4\24\0B\2\2\1K\0\1\0\19load_extension\fpickers\15find_files\1\0\0\1\0\2\vhidden\2\14no_ignore\2\15extensions\bfzf\1\0\0\1\0\4\25override_file_sorter\2\28override_generic_sorter\2\nfuzzy\2\14case_mode\15smart_case\rdefaults\1\0\0\rmappings\6n\n<C-c>\1\0\0\nclose\6i\1\0\0\n<C-k>\28move_selection_previous\n<C-j>\1\0\0\24move_selection_next\25file_ignore_patterns\1\4\0\0\20node_modules/.*\f.git/.*\16.angular/.*\1\0\3\20selection_caret\t‚ùØ \18prompt_prefix\t‚ùØ \20layout_strategy\tflex\nsetup\22telescope.actions\frequire\14telescope\17safe_require\0" },
    loaded = true,
    path = "/home/felipeymn/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n‹\4\0\0\t\0\31\0(6\0\0\0'\2\1\0B\0\2\2\14\0\0\0X\1\1ÄK\0\1\0006\1\2\0'\3\3\0B\1\2\0029\2\4\0005\4\20\0005\5\5\0005\6\6\0=\6\a\0055\6\r\0005\a\t\0009\b\b\1=\b\n\a9\b\v\1=\b\f\a=\a\14\0065\a\16\0009\b\15\1=\b\17\a=\a\18\6=\6\19\5=\5\21\0045\5\23\0005\6\22\0=\6\24\5=\5\25\0045\5\27\0005\6\26\0=\6\28\5=\5\29\4B\2\2\0019\2\30\0'\4\24\0B\2\2\1K\0\1\0\19load_extension\fpickers\15find_files\1\0\0\1\0\2\vhidden\2\14no_ignore\2\15extensions\bfzf\1\0\0\1\0\4\25override_file_sorter\2\28override_generic_sorter\2\nfuzzy\2\14case_mode\15smart_case\rdefaults\1\0\0\rmappings\6n\n<C-c>\1\0\0\nclose\6i\1\0\0\n<C-k>\28move_selection_previous\n<C-j>\1\0\0\24move_selection_next\25file_ignore_patterns\1\4\0\0\20node_modules/.*\f.git/.*\16.angular/.*\1\0\3\20selection_caret\t‚ùØ \18prompt_prefix\t‚ùØ \20layout_strategy\tflex\nsetup\22telescope.actions\frequire\14telescope\17safe_require\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nR\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\21select_next_item\fvisibleR\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\21select_prev_item\fvisibleÄ\3\1\0\t\0\25\0/6\0\0\0'\2\1\0B\0\2\2\14\0\0\0X\1\1Ä2\0(Ä9\1\2\0005\3\6\0009\4\3\0009\4\4\0044\6\3\0005\a\5\0>\a\1\6B\4\2\2=\4\4\0035\4\t\0009\5\a\0009\5\b\5B\5\1\2=\5\n\0049\5\a\0009\5\v\0055\a\14\0009\b\f\0009\b\r\b=\b\15\aB\5\2\2=\5\16\0049\5\a\0009\5\17\5B\5\1\2=\5\18\0049\5\a\0003\a\19\0005\b\20\0B\5\3\2=\5\21\0049\5\a\0003\a\22\0005\b\23\0B\5\3\2=\5\24\4=\4\a\3B\1\2\0012\0\0ÄK\0\1\0K\0\1\0\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\14<C-Space>\rcomplete\t<CR>\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\1\0\0\nclose\fmapping\1\0\0\1\0\1\tname\rnvim_lsp\fsources\vconfig\nsetup\bcmp\17safe_require\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n»\n\0\2\t\1&\0Ü\0016\2\0\0009\2\1\0029\2\2\2\18\4\1\0'\5\3\0'\6\4\0B\2\4\0016\2\0\0009\2\1\0029\2\5\2\18\4\1\0'\5\6\0'\6\a\0'\a\b\0-\b\0\0B\2\6\0016\2\0\0009\2\1\0029\2\5\2\18\4\1\0'\5\6\0'\6\t\0'\a\n\0-\b\0\0B\2\6\0016\2\0\0009\2\1\0029\2\5\2\18\4\1\0'\5\6\0'\6\v\0'\a\f\0-\b\0\0B\2\6\0016\2\0\0009\2\1\0029\2\5\2\18\4\1\0'\5\6\0'\6\r\0'\a\14\0-\b\0\0B\2\6\0016\2\0\0009\2\1\0029\2\5\2\18\4\1\0'\5\6\0'\6\15\0'\a\16\0-\b\0\0B\2\6\0016\2\0\0009\2\1\0029\2\5\2\18\4\1\0'\5\6\0'\6\17\0'\a\18\0-\b\0\0B\2\6\0016\2\0\0009\2\1\0029\2\5\2\18\4\1\0'\5\6\0'\6\19\0'\a\20\0-\b\0\0B\2\6\0016\2\0\0009\2\1\0029\2\5\2\18\4\1\0'\5\6\0'\6\21\0'\a\22\0-\b\0\0B\2\6\0016\2\0\0009\2\1\0029\2\5\2\18\4\1\0'\5\6\0'\6\23\0'\a\24\0-\b\0\0B\2\6\0016\2\0\0009\2\1\0029\2\5\2\18\4\1\0'\5\6\0'\6\25\0'\a\26\0-\b\0\0B\2\6\0016\2\0\0009\2\1\0029\2\5\2\18\4\1\0'\5\6\0'\6\27\0'\a\28\0-\b\0\0B\2\6\0016\2\0\0009\2\1\0029\2\5\2\18\4\1\0'\5\6\0'\6\29\0'\a\30\0-\b\0\0B\2\6\0016\2\0\0009\2\1\0029\2\5\2\18\4\1\0'\5\6\0'\6\31\0'\a \0-\b\0\0B\2\6\0019\2!\0\a\2\"\0X\2\6Ä9\2#\0+\3\1\0=\3$\0029\2#\0+\3\1\0=\3%\2K\0\1\0\3¿\30document_range_formatting\24document_formatting\26resolved_capabilities\fnull-ls\tname*<cmd>lua vim.lsp.buf.formatting()<CR>\r<space>f*<cmd>lua vim.lsp.buf.references()<CR>\agr+<cmd>lua vim.lsp.buf.code_action()<CR>\14<space>ca&<cmd>lua vim.lsp.buf.rename()<CR>\14<space>rn/<cmd>lua vim.lsp.buf.type_definition()<CR>\r<space>DJ<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>\14<space>wl7<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>\14<space>wr4<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>\14<space>wa.<cmd>lua vim.lsp.buf.signature_help()<CR>\n<C-k>.<cmd>lua vim.lsp.buf.implementation()<CR>\agi%<cmd>lua vim.lsp.buf.hover()<CR>\6K*<cmd>lua vim.lsp.buf.definition()<CR>\agd+<cmd>lua vim.lsp.buf.declaration()<CR>\agD\6n\24nvim_buf_set_keymap\27v:lua.vim.lsp.omnifunc\romnifunc\24nvim_buf_set_option\bapi\bvimÚ\4\1\0\17\0\29\0@6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\2\15\0\0\0X\2\2Ä\14\0\1\0X\2\1Ä2\0004Ä6\2\3\0'\4\4\0B\2\2\0029\3\5\2B\3\1\0019\3\6\2B\3\1\0015\3\a\0003\4\b\0005\5\t\0005\6\n\0006\a\v\0\18\t\6\0B\a\2\4H\n\fÄ'\f\f\0\18\r\n\0&\f\r\f6\r\r\0009\r\14\r9\r\15\r\18\15\f\0005\16\16\0=\v\17\16=\f\18\16=\f\19\16B\r\3\1F\n\3\3R\nÚ9\a\20\0016\t\r\0009\t\21\t9\t\22\t9\t\23\tB\t\1\0A\a\0\0026\b\v\0\18\n\5\0B\b\2\4H\v\bÄ8\r\f\0009\r\5\r5\15\24\0=\4\25\0155\16\26\0=\16\27\15=\a\28\15B\r\2\1F\v\3\3R\vˆ2\0\0ÄK\0\1\0K\0\1\0\17capabilities\nflags\1\0\1\26debounce_text_changes\3ñ\1\14on_attach\1\0\0\29make_client_capabilities\rprotocol\blsp\24update_capabilities\nnumhl\vtexthl\ttext\1\0\0\16sign_define\afn\bvim\19DiagnosticSign\npairs\1\0\4\nError\tÔôô \tHint\tÔ†µ \tWarn\tÔî© \tInfo\tÔëâ \1\3\0\0\veslint\rtsserver\0\1\0\2\fnoremap\2\vsilent\2\26enable_format_on_save\nsetup\31plugins.config.lsp.null-ls\frequire\17cmp_nvim_lsp\14lspconfig\17safe_require\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nñ\1\0\0\5\0\6\0\f6\0\0\0'\2\1\0B\0\2\2\14\0\0\0X\1\1ÄK\0\1\0009\1\2\0005\3\3\0005\4\4\0=\4\5\3B\1\2\1K\0\1\0\14highlight\1\0\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\17safe_require\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
try_loadstring("\27LJ\2\nP\0\0\3\0\3\0\t6\0\0\0'\2\1\0B\0\2\2\14\0\0\0X\1\1ÄK\0\1\0009\1\2\0B\1\1\1K\0\1\0\nsetup\22nvim-web-devicons\17safe_require\0", "config", "nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nJ\0\0\4\0\3\0\n6\0\0\0'\2\1\0B\0\2\2\14\0\0\0X\1\1ÄK\0\1\0009\1\2\0004\3\0\0B\1\2\1K\0\1\0\nsetup\flualine\17safe_require\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n∑\1\0\0\5\0\t\0\0186\0\0\0'\2\1\0B\0\2\2\14\0\0\0X\1\1ÄK\0\1\0006\1\2\0'\3\3\0B\1\2\0029\1\4\0016\2\5\0009\2\6\2)\3\0\0=\3\a\0029\2\b\0004\4\0\0B\2\2\1K\0\1\0\nsetup\29nvim_tree_indent_markers\6g\bvim\23nvim_tree_callback\21nvim-tree.config\frequire\14nvim-tree\17safe_require\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
