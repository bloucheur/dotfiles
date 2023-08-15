return {
    "lervag/vimtex",
    enabled = true,

    config = function()
        -- PDF Viewer:
        -- http://manpages.ubuntu.com/manpages/trusty/man5/zathurarc.5.html

        -- vim.g['vimtex_view_method'] = 'zathura'
        -- if not vim.fn.has('macunix') then
        --     vim.g['vimtex_view_method'] = 'zathura'
        --     vim.notify("MACOS DETECTED")
        -- else
        --     vim.g['vimtex_view_method'] = 'zathura'
        --     vim.notify("MACOS DETECTED")
        -- end
        
        vim.g['vimtex_quickfix_mode'] =0

        -- Ignore mappings
        vim.g['vimtex_mappings_enabled'] = 0

        -- Auto Indent
        vim.g['vimtex_indent_enabled'] = 1
        

        -- Syntax highlighting
        vim.g['vimtex_syntax_enabled'] = 0

        -- Error suppression:
        -- https://github.com/lervag/vimtex/blob/master/doc/vimtex.txt

        vim.g['vimtex_log_ignore'] = ({
        'Underfull',
        'Overfull',
        'specifier changed to',
        'Token not allowed in a PDF string',
        })

        vim.g['vimtex_context_pdf_viewer'] = 'okular'

        vim.g['vimtex_compiler_method'] = 'tectonic'

        -- vim.g['vimtex_complete_enabled'] = 1
        -- vim.g['vimtex_compiler_progname'] = 'nvr'
        -- vim.g['vimtex_complete_close_braces'] = 1
            end,
}