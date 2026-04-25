return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "folke/neodev.nvim", -- Enhanced Lua development for Neovim
    },
    config = function()
      -- Setup helper for Neovim Lua development
      require("neodev").setup()

      -- Ensure Mason is initialized
      require("mason").setup()

      local servers = {
        pyright = {},    -- Python
        gopls = {},      -- Go
        nil_ls = {},     -- Nix
        lua_ls = {       -- Lua
          settings = {
            Lua = {
              completion = { callSnippet = "Replace" },
              diagnostics = { globals = { "vim" } },
            },
          },
        },
        tinymist = {},   -- Typst (Current community favorite over typst-lsp)
      }

      require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(servers),
      })

      local lspconfig = require("lspconfig")

      -- Common on_attach function for keybindings
      local on_attach = function(_, bufnr)
        local nmap = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
        end

        nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
        nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
        nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
      end

      -- Iterate through the servers and apply configurations
      for server_name, config in pairs(servers) do
        lspconfig[server_name].setup({
          settings = config.settings,
          filetypes = config.filetypes,
          on_attach = on_attach,
        })
      end
    end,
  },
}
