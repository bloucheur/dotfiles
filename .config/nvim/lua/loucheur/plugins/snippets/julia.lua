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

local helpers = require('loucheur.luasnip-helper-funcs')
local get_visual = helpers.get_visual

local line_begin = require("luasnip.extras.expand_conditions").line_begin


return{
    s(
        {
            trig = "prl",
            dscr="Print line",
            snippetType = "autosnippet",
        },
        fmta(
            [[println(<>)]],
            {
                d(1,get_visual)
            }
        ),
        {condition = line_begin}
    ),

    s(
        {
            trig = "",
            dscr = "",
            snipperType = "",
        },
        fmta(
            [[]],
            {

            }
        ),
        {condition = line_begin}
    ),

}
