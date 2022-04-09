return function()
  local feline = safe_require 'feline'
  local vi_mode_utils = safe_require 'feline.providers.vi_mode'
  local lsp = safe_require 'feline.providers.lsp'
  if not feline then
    return
  end

  local palette = {
   bg0 =        '#2b3339',
   bg1 =        '#323c41',
   bg2 =        '#3a454a',
   bg3 =        '#445055',
   bg4 =        '#4c555b',
   bg5 =        '#53605c',
   bg_visual =  '#503946',
   bg_red =     '#4e3e43',
   bg_green =   '#404d44',
   bg_blue =    '#394f5a',
   bg_yellow =  '#4a4940',
   fg =         '#5c6a72',
   red =        '#f85552',
   orange =     '#f57d26',
   yellow =     '#dfa000',
   green =      '#8da101',
   aqua =       '#35a77c',
   blue =       '#3a94c5',
   purple =     '#df69ba',
   grey0 =      '#a6b0a0',
   grey1 =      '#939f91',
   grey2 =      '#829181',
   statusline1 = '#93b259',
   statusline2 = '#708089',
   statusline3 = '#e66868',
  }

  local vi_mode_colors = {
    NORMAL = palette.bg_green,
    OP = palette.bg_green,
    SHELL = palette.bg_green,
    VISUAL = palette.bg_visual,
    BLOCK = palette.bg_visual,
    LINES = palette.bg_visual,
    REPLACE = palette.bg_red,
    ['V-REPLACE'] = palette.bg_red,
    INSERT = palette.bg_blue,
    ENTER = palette.bg_blue,
    MORE = palette.bg_blue,
    SELECT = palette.bg_red,
    COMMAND = palette.bg_red,
    TERM = palette.bg_yellow,
    NONE = palette.bg1
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
          bg = palette.bg0,
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
            fg = palette.orange,
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
          fg = palette.green,
          bg = palette.bg_visual,
          style = 'bold'
        }
      },
      change = {
        provider = 'git_diff_changed',
        hl = {
          fg = palette.yellow,
          bg = palette.bg_visual,
          style = 'bold'
        }
      },
      remove = {
        provider = 'git_diff_removed',
        hl = {
          fg = palette.red,
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
          bg = palette.bg0,
          fg = palette.fg
        },
        left_sep = { str = ' ', hl = { bg = palette.bg0 }},
        right_sep = { str = ' ', hl = { bg = palette.bg0 }}
      },
      position = {
        provider = 'position',
        hl = {
          bg = palette.bg0,
          fg = palette.fg
        },
        left_sep = { str = ' ', hl = { bg = palette.bg0 }},
        right_sep = { str = ' ', hl = { bg = palette.bg0 }}
      }
    },
    diagnostics = {
      error = {
        provider = 'diagnostic_errors',
        enabled = function () return lsp.diagnostics_exist(vim.diagnostic.severity.ERROR) end,
        hl = {
          bg = palette.bg0,
          fg = palette.red,
          style = 'bold'
        },
        -- right_sep = { str = ' ', hl = { bg = palette.bg0 }}
      },
      warning = {
        provider = 'diagnostic_warnings',
        enabled = function () return lsp.diagnostics_exist(vim.diagnostic.severity.WARN) end,
        hl = {
          bg = palette.bg0,
          fg = palette.yellow,
          style = 'bold'
        },
        -- right_sep = { str = ' ', hl = { bg = palette.bg0 }}
      },
      hint = {
        provider = 'diagnostic_hints',
        enabled = function () return lsp.diagnostics_exist(vim.diagnostic.severity.HINT) end,
        hl = {
          bg = palette.bg0,
          fg = palette.aqua,
          style = 'bold'
        },
        -- right_sep = { str = ' ', hl = { bg = palette.bg0 }}
      },
      info = {
        provider = 'diagnostic_info',
        enabled = function () return lsp.diagnostics_exist(vim.diagnostic.severity.INFO) end,
        hl = {
          bg = palette.bg0,
          fg = palette.blue,
          style = 'bold'
        },
      },
    },
    lsp_client = {
      provider = 'lsp_client_names',
      hl = {
        fg = palette.orange,
        bg = palette.bg0
      },
      right_sep = { str = ' ', hl = { bg = palette.bg0 }}
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
    default_bg = palette.bg1,
    debault_fg = palette.fg,
    components = components,
    vi_mode_colors = vi_mode_colors
  }
end
