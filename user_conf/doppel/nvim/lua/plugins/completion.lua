return {
  {
    "saghen/blink.cmp",
    version = "*", -- Use the latest release
    event = "InsertEnter",
    opts = {
      keymap = { preset = "default" },
      appearance = {
        use_snip_ prestige = true,
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
    },
  },
}
