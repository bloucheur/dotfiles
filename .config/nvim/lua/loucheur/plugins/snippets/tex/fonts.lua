local helpers = require('loucheur.luasnip-helper-funcs')
local get_visual = helpers.get_visual


-- A logical OR of `line_begin` and the regTrig '[^%a]trig'
function line_begin_or_non_letter(line_to_cursor, matched_trigger)
  local line_begin = line_to_cursor:sub(1, -(#matched_trigger + 1)):match("^%s*$")
  local non_letter = line_to_cursor:sub(-(#matched_trigger + 1), -(#matched_trigger + 1)):match("[^%a]")
  return line_begin or non_letter
end

-- Math context detection 
local tsutils = require "loucheur.utils.texzone"

local line_begin = function(line_to_cursor, matched_trigger)
  -- +1 because `string.sub("abcd", 1, -2)` -> abc
  return line_to_cursor:sub(1, -(#matched_trigger + 1)):match("^%s*$")
end

-- Return snippet tables
return
  {
    -- TYPEWRITER i.e. \texttt
    s({trig = "([^%a])tt", regTrig = true, wordTrig = false, snippetType="autosnippet", priority=2000},
      fmta(
        "<>\\texttt{<>}",
        {
          f( function(_, snip) return snip.captures[1] end ),
          d(1, get_visual),
        }
      ),
      {condition = tsutils.in_textzone}
    ),
    -- ITALIC i.e. \textit
    s({trig = "([^%a])tii", regTrig = true, wordTrig = false, snippetType="autosnippet"},
      fmta(
        "<>\\textit{<>}",
        {
          f( function(_, snip) return snip.captures[1] end ),
          d(1, get_visual),
        }
      ),
      {condition = tsutils.in_textzone}
    ),
    -- BOLD i.e. \textbf
    s({trig = "tbb", snippetType="autosnippet"},
      fmta(
        "\\textbf{<>}",
        {
          d(1, get_visual),
        }
      ),
      {condition = tsutils.in_textzone}
    ),
    -- MATH ROMAN i.e. \mathrm
    s({trig = "([^%a])rmm", regTrig = true, wordTrig = false, snippetType="autosnippet"},
      fmta(
        "<>\\mathrm{<>}",
        {
          f( function(_, snip) return snip.captures[1] end ),
          d(1, get_visual),
        }
      ),
      {condition = tsutils.in_mathzone}
    ),
    -- MATH CALIGRAPHY i.e. \mathcal
    s({trig = "([^%a])mcc", regTrig = true, wordTrig = false, snippetType="autosnippet"},
      fmta(
        "<>\\mathcal{<>}",
        {
          f( function(_, snip) return snip.captures[1] end ),
          d(1, get_visual),
        }
      ),
      {condition = tsutils.in_mathzone}
    ),
    -- MATH BOLDFACE i.e. \mathbf
    s({trig = "([^%a])mbf", regTrig = true, wordTrig = false, snippetType="autosnippet"},
      fmta(
        "<>\\mathbf{<>}",
        {
          f( function(_, snip) return snip.captures[1] end ),
          d(1, get_visual),
        }
      ),
      {condition = tsutils.in_mathzone}
    ),
    -- MATH BLACKBOARD i.e. \mathbb
    s({trig = "([^%a])mbb", regTrig = true, wordTrig = false, snippetType="autosnippet"},
      fmta(
        "<>\\mathbb{<>}",
        {
          f( function(_, snip) return snip.captures[1] end ),
          d(1, get_visual),
        }
      ),
      {condition = tsutils.in_mathzone}
    ),
    -- REGULAR TEXT i.e. \text (in math environments)
    s({trig = "([^%a])tee", regTrig = true, wordTrig = false, snippetType="autosnippet"},
      fmta(
        "<>\\text{<>}",
        {
          f( function(_, snip) return snip.captures[1] end ),
          d(1, get_visual),
        }
      ),
      { condition = tsutils.in_mathzone }
    ),
  }