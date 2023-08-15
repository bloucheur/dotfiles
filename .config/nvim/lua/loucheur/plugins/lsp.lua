return {
    "neovim/nvim-lspconfig",
    enabled = true,
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
    },

    config = function()
        local mason = require("mason")
        local mason_lsp = require("mason-lspconfig")
        local lsp = require("lspconfig")

        local cmp_lsp = require("cmp_nvim_lsp")

        local server_settings = {
            ["julials"] = {

            },
            ["pyright"] = {

            },
            ["r_language_server"] = {

            },
            ["texlab"] = {

            },
        }

        for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
            vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
        end


        -- for type, icon in pairs(signs) do
        --     local hl = "DiagnosticSign" .. type
        --     vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        -- end

        local auto_install_servers  = {
            "julials",
            "pyright",
            "texlab",
            -- "r_language_server"
        }

        local servers = {
            "julials",
            "pyright",
            "texlab",
            -- "r_language_server"
        }

        local server_with_disabled_formatting = {
            ["lua_ls"] = true,
        }

        local use_formatter = {
            ["julials"] = true,
            ["texlab"] = true,
          }
        
        local null_ls_format = function(bufnr)
        vim.lsp.buf.format({
            async = true,
            filter = function(client)
            return client.name == "null-ls"
            end,
        })
        bufnr = bufnr
        end

        mason.setup()

        mason_lsp.setup({ ensure_installed = auto_install_servers })

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = cmp_lsp.default_capabilities(capabilities)

        local on_attach = function(client, bufnr)
            local bufopts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
            vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, bufopts)
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
            -- vim.keymap.set("n", "ge", vim.diagnostic.open_float, bufopts) // REMOVED CAR CONFLIT
            vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, bufopts)
            vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, bufopts)
            vim.keymap.set("n", "<leader>dl", ":Telescope diagnostics<CR>", bufopts)
            vim.keymap.set("n", "<leader>ce", vim.lsp.buf.rename, bufopts)

            if server_with_disabled_formatting[client.name] then
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false

                if use_formatter[client.name] then
                    -- vim.keymap.set("n", "<leader>F", null_ls_format, bufopts)
                end
            else
                vim.keymap.set("n", "<leader>F", ":lua vim.lsp.buf.format({ async = true })<CR>", bufopts)
            end
        end

        for _, server in pairs(servers) do
            if server == "rust_analyzer" then
                rust_tools.setup({ tools = { on_initialized = on_attach } })
            else
                lsp[server].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = server_settings[server],
                })
            end
        end
    end,
}
