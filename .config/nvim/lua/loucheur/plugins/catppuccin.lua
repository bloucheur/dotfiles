return {
    "catppuccin/nvim",
    enabled = true,
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    config = function()
        local catppuccin = require("catppuccin")

        catppuccin.setup({
            flavour = "mocha",
            transparent_background = false, -- Disables setting the background color
            show_end_of_buffer = false,     -- Show the '~' characters after the end of the buffers
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
            integrations = {
                cmp = true,
                gitsigns = false,
                nvimtree = true,
                treesitter = true,
                native_lsp = {
                    enabled = true,
                    virtual_text = {
                        errors = { "italic" },
                        hints = { "italic" },
                        warnings = { "italic" },
                        information = { "italic" },
                    },
                    underlines = {
                        errors = { "underline" },
                        hints = { "underline" },
                        warnings = { "underline" },
                        information = { "underline" },
                    },
                    inlay_hints = {
                        background = true,
                    },
                },
                lsp_trouble = true,
                fidget = true,
                -- barbecue = {
                --     dim_dirname = true, -- directory name is dimmed by default
                --     bold_basename = true,
                --     dim_context = false,
                --     alt_background = false,
                -- },
            },
            custom_highlights = function(C)
                return {
                    CmpDocumentation = { fg = C.fg, bg = C.bg_float },
                    CmpDocumentationBorder = { fg = C.border_highlight, bg = C.bg_float },
                    CmpGhostText = { fg = C.terminal_black },
                
                    CmpItemAbbr = { fg = C.fg, bg = C.none },
                    CmpItemAbbrDeprecated = { fg = C.fg_gutter, bg = C.none, strikethrough = true },
                    CmpItemAbbrMatch = { fg = C.blue1, bg = C.none },
                    CmpItemAbbrMatchFuzzy = { fg = C.blue1, bg = C.none },
                
                    CmpItemMenu = { fg = C.comment, bg = C.none },
                
                    CmpItemKindDefault = { fg = C.fg_dark, bg = C.none },
                
                    CmpItemKindKeyword = { fg = C.cyan, bg = C.none },
                
                    CmpItemKindVariable = { fg = C.magenta, bg = C.none },
                    CmpItemKindConstant = { fg = C.magenta, bg = C.none },
                    CmpItemKindReference = { fg = C.magenta, bg = C.none },
                    CmpItemKindValue = { fg = C.magenta, bg = C.none },
                    CmpItemKindCopilot = { fg = C.teal, bg = C.none },
                
                    CmpItemKindFunction = { fg = C.blue, bg = C.none },
                    CmpItemKindMethod = { fg = C.blue, bg = C.none },
                    CmpItemKindConstructor = { fg = C.blue, bg = C.none },
                
                    CmpItemKindClass = { fg = C.orange, bg = C.none },
                    CmpItemKindInterface = { fg = C.orange, bg = C.none },
                    CmpItemKindStruct = { fg = C.orange, bg = C.none },
                    CmpItemKindEvent = { fg = C.orange, bg = C.none },
                    CmpItemKindEnum = { fg = C.orange, bg = C.none },
                    CmpItemKindUnit = { fg = C.orange, bg = C.none },
                
                    CmpItemKindModule = { fg = C.yellow, bg = C.none },
                
                    CmpItemKindProperty = { fg = C.green1, bg = C.none },
                    CmpItemKindField = { fg = C.green1, bg = C.none },
                    CmpItemKindTypeParameter = { fg = C.green1, bg = C.none },
                    CmpItemKindEnumMember = { fg = C.green1, bg = C.none },
                    CmpItemKindOperator = { fg = C.green1, bg = C.none },
                    CmpItemKindSnippet = { fg = C.dark5, bg = C.none },

                    NavicIconsFile = { fg = C.fg, bg = C.none },
                    NavicIconsModule = { fg = C.yellow, bg = C.none },
                    NavicIconsNamespace = { fg = C.fg, bg = C.none },
                    NavicIconsPackage = { fg = C.fg, bg = C.none },
                    NavicIconsClass = { fg = C.orange, bg = C.none },
                    NavicIconsMethod = { fg = C.blue, bg = C.none },
                    NavicIconsProperty = { fg = C.green1, bg = C.none },
                    NavicIconsField = { fg = C.green1, bg = C.none },
                    NavicIconsConstructor = { fg = C.orange, bg = C.none },
                    NavicIconsEnum = { fg = C.orange, bg = C.none },
                    NavicIconsInterface = { fg = C.orange, bg = C.none },
                    NavicIconsFunction = { fg = C.blue, bg = C.none },
                    NavicIconsVariable = { fg = C.magenta, bg = C.none },
                    NavicIconsConstant = { fg = C.magenta, bg = C.none },
                    NavicIconsString = { fg = C.green, bg = C.none },
                    NavicIconsNumber = { fg = C.orange, bg = C.none },
                    NavicIconsBoolean = { fg = C.orange, bg = C.none },
                    NavicIconsArray = { fg = C.orange, bg = C.none },
                    NavicIconsObject = { fg = C.orange, bg = C.none },
                    NavicIconsKey = { fg = C.purple, bg = C.none },
                    NavicIconsKeyword = { fg = C.purple, bg = C.none },
                    NavicIconsNull = { fg = C.orange, bg = C.none },
                    NavicIconsEnumMember = { fg = C.green1, bg = C.none },
                    NavicIconsStruct = { fg = C.orange, bg = C.none },
                    NavicIconsEvent = { fg = C.orange, bg = C.none },
                    NavicIconsOperator = { fg = C.fg, bg = C.none },
                    NavicIconsTypeParameter = { fg = C.green1, bg = C.none },
                    NavicText = { fg = C.fg, bg = C.none },
                    NavicSeparator = { fg = C.fg, bg = C.none },

                    NoiceCompletionItemKindDefault = { fg = C.fg_dark, bg = C.none },

                    NoiceCompletionItemKindKeyword = { fg = C.cyan, bg = C.none },
                
                    NoiceCompletionItemKindVariable = { fg = C.magenta, bg = C.none },
                    NoiceCompletionItemKindConstant = { fg = C.magenta, bg = C.none },
                    NoiceCompletionItemKindReference = { fg = C.magenta, bg = C.none },
                    NoiceCompletionItemKindValue = { fg = C.magenta, bg = C.none },
                
                    NoiceCompletionItemKindFunction = { fg = C.blue, bg = C.none },
                    NoiceCompletionItemKindMethod = { fg = C.blue, bg = C.none },
                    NoiceCompletionItemKindConstructor = { fg = C.blue, bg = C.none },
                
                    NoiceCompletionItemKindClass = { fg = C.orange, bg = C.none },
                    NoiceCompletionItemKindInterface = { fg = C.orange, bg = C.none },
                    NoiceCompletionItemKindStruct = { fg = C.orange, bg = C.none },
                    NoiceCompletionItemKindEvent = { fg = C.orange, bg = C.none },
                    NoiceCompletionItemKindEnum = { fg = C.orange, bg = C.none },
                    NoiceCompletionItemKindUnit = { fg = C.orange, bg = C.none },
                
                    NoiceCompletionItemKindModule = { fg = C.yellow, bg = C.none },
                
                    NoiceCompletionItemKindProperty = { fg = C.green1, bg = C.none },
                    NoiceCompletionItemKindField = { fg = C.green1, bg = C.none },
                    NoiceCompletionItemKindTypeParameter = { fg = C.green1, bg = C.none },
                    NoiceCompletionItemKindEnumMember = { fg = C.green1, bg = C.none },
                    NoiceCompletionItemKindOperator = { fg = C.green1, bg = C.none },
                    NoiceCompletionItemKindSnippet = { fg = C.dark5, bg = C.none },
                }
            end,
        })

        vim.cmd.colorscheme("catppuccin")
    end,
}
