return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "folke/neodev.nvim",
    },
    config = function()
      require("neodev").setup()
      require("mason").setup()

      local servers = {
        pyright = {},
        gopls = {},
        nil_ls = {},
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
            },
          },
        },
        tinymist = {},
      }

      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" },
      })

      -- The New Standard: Use vim.lsp.config directly
      local on_attach = function(_, bufnr)
        local nmap = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
        end

        nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
        nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
        nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
      end

      -- Iterate and setup using the new API
      for server_name, config in pairs(servers) do
        -- This is the specific line that replaces require('lspconfig')[server].setup
        vim.lsp.config(server_name, vim.tbl_extend("force", {
          on_attach = on_attach,
        }, config))
      end
    end,
  },
}
