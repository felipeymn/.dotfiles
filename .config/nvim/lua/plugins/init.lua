local function cfg(name)
  return require(string.format('plugins.config.%s', name))
end

local plugins = {
  {
    'lewis6991/impatient.nvim'
  },
  { -- Packer
    'wbthomason/packer.nvim',
    event = 'VimEnter'
  }, 
  {
    'nathom/filetype.nvim',
    config = cfg 'filetype'
  },
  { -- Colors
    'rebelot/kanagawa.nvim',
    -- after = 'packer.nvim',
    config = cfg 'kanagawa'
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
    'steelsojka/pears.nvim',
    config = cfg 'pears'
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
    config = cfg 'lsp',
    requires = {
      'williamboman/nvim-lsp-installer',
      'jose-elias-alvarez/null-ls.nvim'
    }
  },
  { -- Lualine
    'nvim-lualine/lualine.nvim',
    config = cfg 'lualine'
  },
  { -- Treesitter
    'nvim-treesitter/nvim-treesitter',
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

vim.cmd 'packadd packer.nvim'
local packer = require 'packer'
return packer.startup(function(use)
    for _, plugin in ipairs(plugins) do
    use(plugin)
  end
end)
