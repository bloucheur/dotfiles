return {
    "Pocco81/auto-save.nvim",
    enabled = false,
    config = function()
        local autosave = require("auto-save")
        autosave.setup({
            execution_message = {
                message = function()
                    return "AUTOSAVED"
                end,
            },
            triggered_events = {"TextChangedI"}
        })
    end,
}