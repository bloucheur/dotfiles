return {
  "folke/noice.nvim",
  enabled = true,
  dependencies = {
      "MunifTanjim/nui.nvim",
  },
  event = "VeryLazy",
  config = function()
      require("noice").setup({
          cmdline = {
              enabled = true,
              view = "cmdline_popup",
          },
          popupmenu = {
              enabled = true,
              backend = "nui", -- nui | cmp
          },
          messages = {
              enabled = true,
              view = "notify",
              -- view_search = false,
          },
          notify = {
              enabled = true,
              view = "notify",
          },
          lsp = {
              progress = {
                  enabled = true,
                  view = "mini",
              },
              documentation = {
                  opts = {
                      border = { style = "rounded" },
                      position = {
                          row = 2,
                      },
                      win_options = {
                          winhighlight = {
                              NormalFloat = "Normal",
                          },
                      },
                  },
              },
              signature = { enabled = false },
              hover = { enabled = true },
              -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
              override = {
                  ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                  ["vim.lsp.util.stylize_markdown"] = false,
                  ["cmp.entry.get_documentation"] = true,
              },
          },
          presets = {
            bottom_search = true, -- use a classic bottom cmdline for search
            command_palette = true, -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = false, -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = false, -- add a border to hover docs and signature help
          },
          views = {
              cmdline_popup = {
                  position = {
                      row = 8,
                      col = "50%",
                  },
                  size = {
                      width = math.floor(vim.o.columns * 0.4),
                      height = "auto",
                  },
              },
              popupmenu = {
                  relative = "editor",
                  position = {
                      row = 11,
                      col = "50%",
                  },
                  size = {
                      width = math.floor(vim.o.columns * 0.4),
                      height = "auto",
                  },
                  border = {
                      style = "rounded",
                  },
              },
              mini = {
                  position = {
                      row = "96%",
                  },
              },
          },
          routes = {
              -- Show recording messages
              -- {
              --     filter = { event = "msg_showmode" },
              --     view = "notify",
              -- },

              -- Redirect long messages
              {
                  filter = {
                      event = "msg_show",
                      min_height = 10,
                  },
                  view = "cmdline_output",
              },

              -- Hide written, more/less lines, lines changed, etc messages
              {
                  filter = {
                      event = "msg_show",
                      kind = "",
                      any = {
                          { find = "%d+B written" },
                          { find = "%d+ change" },
                          { find = "%d+ more lines?" },
                          { find = "%d+ fewer lines?" },
                          { find = "%d+ lines? less" },
                          { find = "%d+ lines? yanked" },
                          { find = "Already at newest change" },
                      },
                  },
                  opts = { skip = true },
              },
              -- Hide other messages
              -- {
              --     filter = {
              --         any = {
              --
              --         },
              --     },
              --     opts = { skip = true },
              -- },
          },
      })
  end,
}