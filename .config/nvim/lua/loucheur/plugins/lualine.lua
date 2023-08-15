local c_filetype = { "filetype", cond = nil, padding = { left = 1, right = 1 } }
local c_spaces = { -- TODO A ENLEVER APRES SETUP DES SHIFTWIDTH PARTOUT
    function()
        local shiftwidth = vim.api.nvim_buf_get_option(0, "shiftwidth")
        return icons.ui.Tab .. " " .. shiftwidth
    end,
    padding = 1,
}

local c_progress = {
    "progress",
    fmt = function()
        return "%P/%L"
    end,
}
local hide_in_width = function()
    return vim.o.columns > 100
end

local c_lsp = {
    function()
        local buf_clients = vim.lsp.get_active_clients { bufnr = 0 }
        if #buf_clients == 0 then
            return "LSP Inactive"
        end

        local buf_ft = vim.bo.filetype
        local buf_client_names = {}
        local copilot_active = false

        -- add client
        for _, client in pairs(buf_clients) do
            if client.name ~= "null-ls" and client.name ~= "copilot" then
                table.insert(buf_client_names, client.name)
            end

            if client.name == "copilot" then
                copilot_active = true
            end
        end

        -- TODO : CHECK LUNARVIM

        --   -- add formatter
        --   local formatters = require "lvim.lsp.null-ls.formatters"
        --   local supported_formatters = formatters.list_registered(buf_ft)
        --   vim.list_extend(buf_client_names, supported_formatters)

        --   -- add linter
        --   local linters = require "lvim.lsp.null-ls.linters"
        --   local supported_linters = linters.list_registered(buf_ft)
        --   vim.list_extend(buf_client_names, supported_linters)

        local unique_client_names = table.concat(buf_client_names, ", ")
        local language_servers = string.format("[%s]", unique_client_names)

        if copilot_active then
            language_servers = language_servers .. "%#SLCopilot#" .. " " .. icons.git.Octoface .. "%*"
        end

        return language_servers
    end,
    color = { gui = "bold" },
    cond = hide_in_width
}

local c_mode = {
    "mode"
    -- function()
    --   return " " .. icons.ui.Target .. " "
    -- end,
    -- padding = { left = 0, right = 0 },
    -- color = {},
    -- cond = nil,
}
local function diff_source()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
        return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed,
        }
    end
end

local c_diagnostic = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = {
        error = icons.diagnostics.BoldError .. " ",
        warn = icons.diagnostics.BoldWarning .. " ",
        info = icons.diagnostics.BoldInformation .. " ",
        hint = icons.diagnostics.BoldHint .. " "
    }
}

local c_diff = {
    "diff",
    source = diff_source,
    symbols = {
        added = icons.git.LineAdded .. " ",
        modified = icons.git.LineModified .. " ",
        removed = icons.git.LineRemoved .. " ",
    },
    padding = {left = 2, right = 1},
    diff_color = {
        added = {fg = "#98be65"},
        modified = {fg = "#ECBE7B"},
        removed = {fg =  "#ec5f67"},
    },
    cond = nil,
}

return {
    "nvim-lualine/lualine.nvim",

    opts = {
        options = {
            icons_enabled        = true,
            theme                = "catppuccin",
            global_status        = true,
            component_separators = { left = "", right = "" },
            section_separators   = { left = "", right = "" },
            disabled_filetype    = { "alpha" },

            refresh              = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            }
        },
        sections = {
            lualine_a = { c_mode },
            lualine_b = { "branch",icons.git.Branch},
            lualine_c = { c_diff },
            lualine_x = { c_diagnostic, c_lsp, c_spaces, c_filetype },
            lualine_y = { "location" },
            lualine_z = { c_progress },
        },
        inactive_sections = {
            lualine_a = { c_mode },
            lualine_b = { "branch" },
            lualine_c = { c_diff },
            lualine_x = { c_diagnostic, c_lsp, c_spaces, c_filetype },
            lualine_y = { "location" },
            lualine_z = { c_progress },
        },
    }
}
