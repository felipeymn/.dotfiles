local function config()
  local telescope = safe_require 'telescope'
  local actions = safe_require 'telescope.actions'
  if not telescope or not actions then
    return
  end

  telescope.setup {
    defaults = {
      layout_strategy = 'flex',
      prompt_prefix = '  ',
      selection_caret = ' ',
      file_ignore_patterns = { 'node_modules/.*', '.git/.*', '.angular/.*'},
      mappings = {
        i = {
          ['<C-j>'] = actions.move_selection_next,
          ['<C-k>'] = actions.move_selection_previous,
        },
        n = { ['<C-c>'] = actions.close }
      }
    },
    extensions = {
      fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true,  -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case"         -- or "ignore_case" or "respect_case"
      }
    },
    pickers = {
      find_files = {
        hidden = true,
        -- previewer = false,
        no_ignore = true
      }
    }
  }

  telescope.load_extension('fzf')
end

return function()
  local telescope = {
    {
      'nvim-telescope/telescope.nvim',
      cmd = 'Telescope',
      config = config,
      requires = { 'nvim-lua/plenary.nvim' }
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
       run = 'make'
    }
  }
  return telescope
end
