local function cfg(name)
  return require(string.format('plugins.config.%s', name))
end

local plugins = {
  {
    'lewis6991/impatient.nvim'
  },
  { -- Packer
    'wbthomason/packer.nvim',
    -- event = 'VimEnter'
  }, 
  {
    'nathom/filetype.nvim',
    config = cfg 'filetype'
  },
-- Colors
  {
    'sainnhe/everforest',
    -- after = 'packer.nvim'
  },
  { -- Icons
    'kyazdani42/nvim-web-devicons',
    config = cfg 'nvim-web-devicons'
  },
  {
    'akinsho/bufferline.nvim',
    after = "nvim-web-devicons",
    config = cfg 'bufferline'
  },
  { -- Tree
    'kyazdani42/nvim-tree.lua',
    after = 'nvim-web-devicons',
    cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
    config = cfg 'nvim-tree'
  },
  {
    'sunjon/shade.nvim',
    config = cfg 'shade'
  },
  {
    'goolord/alpha-nvim',
    config = cfg 'alpha'
  },
  {
    'windwp/nvim-ts-autotag',
    config = cfg 'nvim-ts-autotag'
  },
  {
    'lewis6991/gitsigns.nvim',
    setup = function()
      packer_lazy_load 'gitsigns.nvim'
    end,
    config = cfg 'gitsigns'
  },
  { -- Fuzzy Finder
    {
      'nvim-telescope/telescope.nvim',
      cmd = 'Telescope',
      config = cfg 'telescope',
      requires = { 'nvim-lua/plenary.nvim' }
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
       run = 'make'
    }
  },
  { -- Lsp
    'neovim/nvim-lspconfig',
    setup = function()
      packer_lazy_load 'nvim-lspconfig'
      -- reload the current file so lsp actually starts for it
      vim.defer_fn(function()
        vim.cmd 'if &ft == "packer" | echo "" | else | silent! e %'
      end, 0)
    end,
    config = cfg 'lsp'
  },
  {
    'jose-elias-alvarez/null-ls.nvim'
  },
  { -- Feline
    'feline-nvim/feline.nvim',
    after = 'nvim-web-devicons',
    config = cfg 'feline'
  },
  {
    'numToStr/Comment.nvim',
    config = cfg 'comment'
  },
  { -- Treesitter
    'nvim-treesitter/nvim-treesitter',
    event = 'BufRead',
    config = cfg 'nvim-treesitter'
  },
  { -- Autocompletion plugin
    'hrsh7th/nvim-cmp',
    config = cfg 'nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp'
    }
  }
}

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  for _, plugin in ipairs(plugins) do
    use(plugin)
  end
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
