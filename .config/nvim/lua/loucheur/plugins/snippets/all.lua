local ls = require("luasnip")
local e = require("luasnip.extras")
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local s = ls.s
local i = ls.insert_node
local t = ls.text_node
local c = ls.choice_node
local f = ls.function_node
local d = ls.dynamic_node
local l = e.lambda
local dl = e.dynamic_lambda
local sn = ls.sn
local rep = e.rep

local function get_cstring(ctype)
    local calculate_comment_string = require("Comment.ft").calculate
    local cutils = require "Comment.utils"
    -- use the `Comments.nvim` API to fetch the comment string for the region (eq. '--%s' or '--[[%s]]' for `lua`)
    local cstring = calculate_comment_string { ctype = ctype, range = cutils.get_region() }
        or vim.bo.commentstring
    -- as we want only the strings themselves and not strings ready for using `format` we want to split the left and right side
    local left, right = cutils.unwrap_cstr(cstring)
    -- create a `{left, right}` table for it
    return { left, right }
end

local function pick_comment_start_and_end()
    -- because lua block comment is unlike other language's,
    -- so handle lua ctype
    local ctype = 2
    if vim.opt.ft:get() == "lua" then
      ctype = 1
    end
    local cs = get_cstring(ctype)[1]
    local ce = get_cstring(ctype)[2]
    if ce == "" or ce == nil then
      ce = cs
    end
    return cs, ce
  end
  
  local get_comment_start = function()
    local cs, _ = pick_comment_start_and_end()
    return string.sub(cs,1,1)
  end

return {

s({ trig = "todo", dscr="Selection of comments", snippetType = "autosnippet" }, {
    p(get_comment_start),
    t " ",
    c(1, { t "TODO", t "FIX", t "NOTE", t "HACK", t "WARN", t "PERF", t "TEST" }),
    t ": ",
    i(0),
  }),
}