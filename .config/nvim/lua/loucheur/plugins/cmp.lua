-- local status_cmp_ok, cmp_types = pcall(require, "cmp.types.cmp")
--   if not status_cmp_ok then
--     return
--   end


local ConfirmBehavior = {
    Insert = 'insert',
    Replace = 'replace',
  }
local SelectBehavior = {
    Insert = 'insert',
    Select = 'select',
  }

  local confirm_opts = {
    behavior = ConfirmBehavior.Replace,
    select = false,
  }
local source_names = {
    nvim_lsp = "(LSP)",
    emoji = "(Emoji)",
    path = "(Path)",
    calc = "(Calc)",
    cmp_tabnine = "(Tabnine)",
    vsnip = "(Snippet)",
    luasnip = "(Snippet)",
    buffer = "(Buffer)",
    tmux = "(TMUX)",
    copilot = "(Copilot)",
    treesitter = "(TreeSitter)",
  }

local duplicates = {
    buffer = 1,
    path = 1,
    nvim_lsp = 0,
    luasnip = 1,
  }

local window = function(opts)
  opts = opts or {}
  return {
    border = opts.border or 'rounded',
    winhighlight = opts.winhighlight or 'Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None',
    zindex = opts.zindex or 1001,
    scrolloff = opts.scrolloff or 0,
    col_offset = opts.col_offset or 0,
    side_padding = opts.side_padding or 1,
    scrollbar = opts.scrollbar == nil and true or opts.scrollbar,
  }
end

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end


return {
    "hrsh7th/nvim-cmp",
    enabled=true,

    dependencies = {
        "L3MON4D3/LuaSnip",
        "hrsh7th/cmp-nvim-lsp",
        "saadparwaiz1/cmp_luasnip",
        "onsails/lspkind.nvim",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
    },

    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        cmp.setup({
            active = true,
            on_config_done = nil,
            confirm_opts = {
                behavior = ConfirmBehavior.Replace,
                select = false,
            },
            completion = {
                ---@usage The minimum length of a word to complete on.
                keyword_length = 1,
            },
            experimental = {
                ghost_text = false,
                native_menu = false,
            },
            formatting = {
                fields = { "kind", "abbr", "menu" },
                max_width = 0,
                kind_icons = icons.kind,
                source_names = source_names,
                duplicates = {
                    buffer = 1,
                    path = 1,
                    nvim_lsp = 0,
                    luasnip = 1,
                },
                duplicates_default = 0,
                format = function(entry, vim_item)
                    local max_width = 0
                    -- local max_width = lvim.builtin.cmp.formatting.max_width 
                    if max_width ~= 0 and #vim_item.abbr > max_width then
                        vim_item.abbr = string.sub(vim_item.abbr, 1, max_width - 1) .. icons.ui.Ellipsis
                    end
                    vim_item.kind = icons.kind[vim_item.kind]

                    if entry.source.name == "copilot" then
                        vim_item.kind = icons.git.Octoface
                        vim_item.kind_hl_group = "CmpItemKindCopilot"
                    end

                    if entry.source.name == "cmp_tabnine" then
                        vim_item.kind = icons.misc.Robot
                        vim_item.kind_hl_group = "CmpItemKindTabnine"
                    end

                    if entry.source.name == "crates" then
                        vim_item.kind = icons.misc.Package
                        vim_item.kind_hl_group = "CmpItemKindCrate"
                    end

                    if entry.source.name == "lab.quick_data" then
                        vim_item.kind = icons.misc.CircuitBoard
                        vim_item.kind_hl_group = "CmpItemKindConstant"
                    end

                    if entry.source.name == "emoji" then
                        vim_item.kind = icons.misc.Smiley
                        vim_item.kind_hl_group = "CmpItemKindEmoji"
                    end
                    vim_item.menu = source_names[entry.source.name]
                    vim_item.dup = duplicates[entry.source.name]
                        or 0
                    return vim_item
                end,
            },
            snippet = {
                expand = function(args)
                  luasnip.lsp_expand(args.body)
                end,
              },
              window = {
                completion = window(),
                documentation = window(),
              },
              sources = {
                {
                  name = "copilot",
                  -- keyword_length = 0,
                  max_item_count = 3,
                  trigger_characters = {
                    {
                      ".",
                      ":",
                      "(",
                      "'",
                      '"',
                      "[",
                      ",",
                      "#",
                      "*",
                      "@",
                      "|",
                      "=",
                      "-",
                      "{",
                      "/",
                      "\\",
                      "+",
                      "?",
                      " ",
                      -- "\t",
                      -- "\n",
                    },
                  },
                },
                {
                  name = "nvim_lsp",
                  entry_filter = function(entry, ctx)
                    local kind = require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]
                    if kind == "Snippet" and ctx.prev_context.filetype == "java" then
                      return false
                    end
                    return true
                  end,
                },
          
                { name = "path" },
                { name = "luasnip" },
                { name = "cmp_tabnine" },
                { name = "nvim_lua" },
                { name = "buffer" },
                { name = "calc" },
                { name = "emoji" },
                { name = "treesitter" },
                { name = "crates" },
                { name = "tmux" },
              },
              mapping = cmp.mapping.preset.insert {
                ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
                ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
                ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item { behavior = SelectBehavior.Select }, { "i" }),
                ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item { behavior = SelectBehavior.Select }, { "i" }),
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-y>"] = cmp.mapping {
                  i = cmp.mapping.confirm { behavior = ConfirmBehavior.Replace, select = false },
                  c = function(fallback)
                    if cmp.visible() then
                      cmp.confirm { behavior = ConfirmBehavior.Replace, select = false }
                    else
                      fallback()
                    end
                  end,
                },
                ["<Tab>"] = cmp.mapping(function(fallback)
                  if cmp.visible() then
                    cmp.select_next_item()
                  elseif luasnip.expand_or_locally_jumpable() then
                    luasnip.expand_or_jump()
                  elseif luasnip.jumpable(1) then
                    luasnip.jump(1)
                  elseif has_words_before() then
                    -- cmp.complete()
                    fallback()
                  else
                    fallback()
                  end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                  if cmp.visible() then
                    cmp.select_prev_item()
                  elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                  else
                    fallback()
                  end
                end, { "i", "s" }),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping(function(fallback)
                  if cmp.visible() then
                    local confirm_opts = vim.deepcopy(confirm_opts) -- avoid mutating the original opts below
                    local is_insert_mode = function()
                      return vim.api.nvim_get_mode().mode:sub(1, 1) == "i"
                    end
                    if is_insert_mode() then -- prevent overwriting brackets
                      confirm_opts.behavior = ConfirmBehavior.Insert
                    end
                    local entry = cmp.get_selected_entry()
                    local is_copilot = entry and entry.source.name == "copilot"
                    if is_copilot then
                      confirm_opts.behavior = ConfirmBehavior.Replace
                      confirm_opts.select = true
                    end
                    if cmp.confirm(confirm_opts) then
                      return -- success, exit early
                    end
                  end
                  fallback() -- if not exited early, always fallback
                end),
              },
              cmdline = {
                enable = false,
                options = {
                  {
                    type = ":",
                    sources = {
                      { name = "path" },
                      { name = "cmdline" },
                    },
                  },
                  {
                    type = { "/", "?" },
                    sources = {
                      { name = "buffer" },
                    },
                  },
                },
            },

        })
    end,
}
