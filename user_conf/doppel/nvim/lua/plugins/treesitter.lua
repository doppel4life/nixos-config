return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        -- These match your requested languages
        ensure_installed = { "python", "go", "nix", "lua", "typst", "markdown", "vimdoc" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
