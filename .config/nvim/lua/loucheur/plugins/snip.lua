return {
    "L3MON4D3/LuaSnip",
    version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
    enabled = true,
    priority= 1000,
    config = function()
        local luasnip = require("luasnip")
        luasnip.config.set_config({
            enable_autosnippets = true,
            store_selection_keys = "<Tab>",
        })


        require("luasnip.loaders.from_lua").load({
            paths = "~/.config/nvim/lua/loucheur/plugins/snippets"
        })
    end
}