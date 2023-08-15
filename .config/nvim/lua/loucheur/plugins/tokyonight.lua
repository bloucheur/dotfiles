return {
    "folke/tokyonight.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
        local tokyonight = require("tokyonight")

        tokyonight.setup({
            on_highlights = function(hl, c)
                hl.IndentBlanklineContextChar = {
                  fg = c.dark5,
                }
                hl.TSConstructor = {
                  fg = c.blue1,
                }
                hl.TSTagDelimiter = {
                  fg = c.dark5,
                }
              end,
              style = "night", -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
        styles = {
          -- Style to be applied to different syntax groups
          -- Value is any valid attr-list value for `:help nvim_set_hl`
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
          -- Background styles. Can be "dark", "transparent" or "normal"
          sidebars = "dark", -- style for sidebars, see below
          floats = "dark", -- style for floating windows
        },
        -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
        sidebars = {
            "qf",
            "vista_kind",
            "terminal",
            "packer",
            "spectre_panel",
            "NeogitStatus",
            "help",
          },
            no_italic = true,
            styles = {                      -- Handles the styles of general hi groups (see `:h highlight-args`):
                comments = {},              -- Change the style of comments
                conditionals = {},
                loops = {},
                functions = {},
                keywords = {},
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
                operators = {},
            },
        })
        vim.cmd.colorscheme("tokyonight-moon")
    end,

  }