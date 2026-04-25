vim.opt.termguicolors = true

-- Nord palette
local nord = {
  bg        = "#292E39",
  bg_dark   = "#262B35",
  fg        = "#D8DEE9",
  fg_dark   = "#4C566A",
  red       = "#BF616A",
  green     = "#A3BE8C",
  yellow    = "#EBCB8B",
  blue      = "#81A1C1",
  magenta   = "#B48EAD",
  cyan      = "#88C0D0",
  orange    = "#D08770",
}

-- Clear & reset
vim.cmd("highlight clear")
vim.cmd("syntax reset")
vim.o.background = "dark"
vim.g.colors_name = "nord_custom"

local hl = vim.api.nvim_set_hl

-- Core UI
hl(0, "Normal",       { fg = nord.fg, bg = nord.bg })
hl(0, "CursorLine",   { bg = nord.bg_dark })
hl(0, "LineNr",       { fg = nord.fg_dark })
hl(0, "CursorLineNr", { fg = nord.yellow, bold = true })
hl(0, "SignColumn",   { bg = nord.bg })
hl(0, "VertSplit",    { fg = nord.bg_dark })
hl(0, "Visual",       { bg = nord.fg_dark })
hl(0, "Search",       { fg = nord.bg, bg = nord.yellow })
hl(0, "IncSearch",    { fg = nord.bg, bg = nord.orange })

-- Syntax
hl(0, "Comment",      { fg = nord.fg_dark, italic = true })
hl(0, "String",       { fg = nord.green })
hl(0, "Number",       { fg = nord.orange })
hl(0, "Boolean",      { fg = nord.orange })
hl(0, "Function",     { fg = nord.blue })
hl(0, "Keyword",      { fg = nord.magenta })
hl(0, "Type",         { fg = nord.yellow })
hl(0, "Identifier",   { fg = nord.cyan })
hl(0, "Operator",     { fg = nord.magenta })

-- Diagnostics (LSP)
hl(0, "DiagnosticError", { fg = nord.red })
hl(0, "DiagnosticWarn",  { fg = nord.yellow })
hl(0, "DiagnosticInfo",  { fg = nord.blue })
hl(0, "DiagnosticHint",  { fg = nord.cyan })

-- Floating / popup
hl(0, "NormalFloat", { fg = nord.fg, bg = nord.bg_dark })
hl(0, "FloatBorder", { fg = nord.blue, bg = nord.bg_dark })
