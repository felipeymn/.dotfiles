return function()
  local feline = safe_require 'feline'
  local kanagawa_colors = safe_require 'kanagawa.colors'
  local vi_mode_utils = safe_require 'feline.providers.vi_mode'
  local lsp = safe_require 'feline.providers.lsp'
  if not feline or not kanagawa_colors or not vi_mode_utils or not lsp then
    return
  end

  local palette = kanagawa_colors.setup()

  local vi_mode_colors = {
    NORMAL = palette.diff.add,
    OP = palette.diff.add,
    SHELL = palette.diff.add,
    VISUAL = palette.bg_light3,
    BLOCK = palette.bg_light3,
    LINES = palette.bg_light3,
    REPLACE = palette.sp2,
    ['V-REPLACE'] = palette.sp2,
    INSERT = palette.bg_search,
    ENTER = palette.bg_search,
    MORE = palette.bg_search,
    SELECT = palette.co,
    COMMAND = palette.diff.delete,
    TERM = palette.diff.change,
    NONE = palette.id
  }

  local comps = {
    vi_mode = {
      provider = function()
        return ' ' .. vi_mode_utils.get_vim_mode() .. ' '
      end,
      hl = function()
        local val = {
          name = vi_mode_utils.get_mode_highlight_name(),
          bg = vi_mode_utils.get_mode_color(),
          fg = palette.fg,
          style = 'bold'
        }
        return val
      end,
      left_sep = {
        str = '  ',
        hl = {
          bg = palette.bg,
          fg = palette.fg
        }
      }
    },
    git = {
      branch = {
        provider = 'git_branch',
        icon = {
          str = ' ',
          hl = {
            fg = palette.pp,
            bg = palette.bg_visual
          }
        },
        hl = {
          fg = palette.fg,
          bg = palette.bg_visual,
          style = 'bold'
        },
        left_sep = { str = ' ', hl = { bg = palette.bg_visual }},
        right_sep = { str = ' ', hl = { bg = palette.bg_visual }}
      },
      add = {
        provider = 'git_diff_added',
        hl = {
          fg = palette.git.added,
          bg = palette.bg_visual,
          style = 'bold'
        }
      },
      change = {
        provider = 'git_diff_changed',
        hl = {
          fg = palette.git.changed,
          bg = palette.bg_visual,
          style = 'bold'
        }
      },
      remove = {
        provider = 'git_diff_removed',
        hl = {
          fg = palette.git.removed,
          bg = palette.bg_visual,
          style = 'bold'
        },
        right_sep = { str = ' ', hl = { bg = palette.bg_visual }, always_visible = true}
      }

    },
    file = {
      name = {
        provider = { name = "file_info", opts = { type = "base_only" } },
        hl = {
          bg = palette.bg_dark,
          fg = palette.fg_dark
        },
        left_sep = { str = ' ', hl = { bg = palette.bg_dark }},
        right_sep = { str = ' ', hl = { bg = palette.bg_dark }}
      },
      position = {
        provider = 'position',
        hl = {
          bg = palette.bg_dark,
          fg = palette.fg
        },
        left_sep = { str = ' ', hl = { bg = palette.bg_dark }},
        right_sep = { str = ' ', hl = { bg = palette.bg_dark }}
      }
    },
    diagnostics = {
      error = {
        provider = 'diagnostic_errors',
        enabled = function () return lsp.diagnostics_exist(vim.diagnostic.severity.ERROR) end,
        hl = {
          bg = palette.bg_dark,
          fg = palette.diag.error,
          style = 'bold'
        },
        -- right_sep = { str = ' ', hl = { bg = palette.bg_dark }}
      },
      warning = {
        provider = 'diagnostic_warnings',
        enabled = function () return lsp.diagnostics_exist(vim.diagnostic.severity.WARN) end,
        hl = {
          bg = palette.bg_dark,
          fg = palette.diag.warning,
          style = 'bold'
        },
        -- right_sep = { str = ' ', hl = { bg = palette.bg_dark }}
      },
      hint = {
        provider = 'diagnostic_hints',
        enabled = function () return lsp.diagnostics_exist(vim.diagnostic.severity.HINT) end,
        hl = {
          bg = palette.bg_dark,
          fg = palette.diag.hint,
          style = 'bold'
        },
        -- right_sep = { str = ' ', hl = { bg = palette.bg_dark }}
      },
      info = {
        provider = 'diagnostic_info',
        enabled = function () return lsp.diagnostics_exist(vim.diagnostic.severity.INFO) end,
        hl = {
          bg = palette.bg_dark,
          fg = palette.diag.info,
          style = 'bold'
        },
      },
    },
    lsp_client = {
      provider = 'lsp_client_names',
      hl = {
        fg = palette.pp,
        bg = palette.bg_dark
      },
      right_sep = { str = ' ', hl = { bg = palette.bg_dark }}
    }
  }


  local components ={
    active = {{}, {}, {}},
    inactive = {{}, {}, {}},
  }

  -- left
  components.active[1][1] = comps.vi_mode
  components.active[1][2] = comps.file.name
  components.active[1][3] = comps.diagnostics.error
  components.active[1][4] = comps.diagnostics.warning
  components.active[1][5] = comps.diagnostics.hint
  components.active[1][6] = comps.diagnostics.info

  -- right
  components.active[3][1] = comps.lsp_client
  components.active[3][2] = comps.file.position
  components.active[3][3] = comps.git.branch
  components.active[3][4] = comps.git.add
  components.active[3][5] = comps.git.change
  components.active[3][6] = comps.git.remove

  feline.setup {
    components = components,
    vi_mode_colors = vi_mode_colors
  }
end
