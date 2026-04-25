vim.opt.termguicolors = true

-- Nord palette
local nord = {
  bg        = "#282828",
  bg_dark   = "#1D2021",
  fg        = "#ebdbb2",
  fg_dark   = "#a89984",
  red       = "#CC241D",
  green     = "#98971A",
  yellow    = "#d79921",
  blue      = "#458588",
  magenta   = "#B16285",
  cyan      = "#689D6A",
  orange    = "#d65d0e",
}

-- Clear & reset
vim.cmd("highlight clear")
vim.cmd("syntax reset")
vim.o.background = "dark"
vim.g.colors_name = "gruvbox_custom"

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
