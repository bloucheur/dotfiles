return {
    "nvim-tree/nvim-tree.lua",

    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    name = "nvim-tree",
    lazy = true,
    keys = {
        { "<leader>e", "<cmd> NvimTreeToggle <CR>", desc = 'Explorer' },
        -- {"<leader>t", "<cmd> NvimTreeFocus <CR>"}
    },
    config = {
        disable_netrw = true,
        hijack_netrw = false,
        hijack_cursor = false,
        root_dirs = {},

        view = {
            adaptive_size = true,
            side = "left",
            width = 20,
            preserve_window_proportions = false,
        },
        git = {
            enable = false,
            ignore = true,
        },
        filesystem_watchers = {
            enable = true,
        },
        actions = {
            open_file = {
                resize_window = true,
            },
        },
        renderer = {
            root_folder_label = ":t", -- TODO,
            highlight_git = false,
            full_name = false,
            icons = {
                show = {
                    file = true,
                    folder = true,
                    folder_arrow = true,
                    git = false,
                },
                glyphs = {
                    default = icons.ui.Text,
                    symlink = icons.ui.FileSymlink,
                    bookmark = icons.ui.BookMark,
                    modified = "●",
                    folder = {
                        arrow_closed = icons.ui.TriangleShortArrowRight,
                        arrow_open = icons.ui.TriangleShortArrowDown,
                        default = icons.ui.Folder,
                        open = icons.ui.FolderOpen,
                        empty = icons.ui.EmptyFolder,
                        empty_open = icons.ui.EmptyFolderOpen,
                        symlink = icons.ui.FolderSymlink,
                        symlink_open = icons.ui.FolderOpen,
                    },
                    git = {
                        unstaged = icons.git.FileUnstaged,
                        staged = icons.git.FileStaged,
                        unmerged = icons.git.FileUnmerged,
                        renamed = icons.git.FileRenamed,
                        untracked = icons.git.FileUntracked,
                        deleted = icons.git.FileDeleted,
                        ignored = icons.git.FileIgnored,
                    },
                },
            },
        },
        diagnostics = {
            enable = true,
            show_on_dirs = false,
            show_on_open_dirs = true,
            debounce_delay = 50,
            severity = {
                min = vim.diagnostic.severity.HINT,
                max = vim.diagnostic.severity.ERROR,
            },
            icons = {
                hint = icons.diagnostics.BoldHint,
                info = icons.diagnostics.BoldInformation,
                warning = icons.diagnostics.BoldWarning,
                error = icons.diagnostics.BoldError,
            },
        }
    }
}
