local function config()
  local neorg = safe_require 'neorg'
  if not neorg then
    return
  end

  neorg.setup{
    load = {
        ["core.defaults"] = {},
        ["core.norg.concealer"] = {
          config = {
            markup_preset = "conceal",
            icon_preset = "diamond"
          },
          icons = {
            marker = {
              enabled = true,
              icon = " ",
            },
            todo = {
              enable = true,
              pending = {
                  -- icon = ""
                  icon = "",
              },
              uncertain = {
                  icon = "?",
              },
              urgent = {
                  icon = "",
              },
              on_hold = {
                  icon = "",
              },
              cancelled = {
                  icon = "",
              },
            },
            heading = {
              enabled = true,
              level_1 = {
                icon = "◈",
              },
              level_2 = {
                icon = " ◇",
              },
              level_3 = {
                icon = "  ◆",
              },
              level_4 = {
                icon = "   ❖",
              },
              level_5 = {
                icon = "    ⟡",
              },
              level_6 = {
                icon = "     ⋄",
              },
            },
          },
        },
        ["core.norg.completion"] = {},
        ["core.norg.dirman"] = {
          config = {
            workspaces = {
              notes = "~/documents/notes",
            }
          }
        }
    }
  }
end

return function()
  local neorg = {
    'nvim-neorg/neorg',
    config = config,
    requires = 'nvim-lua/plenary.nvim'
  }
  return neorg
end
