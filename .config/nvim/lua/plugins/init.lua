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

vim.cmd 'packadd packer.nvim'
local packer = require 'packer'
return packer.startup(function(use)
    for _, plugin in ipairs(plugins) do
    use(plugin)
  end
end)
