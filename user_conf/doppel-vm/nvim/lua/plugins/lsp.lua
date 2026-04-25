return {
  {
    "neovim/nvim-lspconfig",
    event = {"BufReadPre", "BufNewFile"}
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "saghen/blink.cmp"
    },
    config = function()
      require("mason").setup()
      
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" }, 
      })

      local capabilities = require('blink.cmp').get_lsp_capabilities()

      vim.lsp.config('*', {
        capabilities = capabilities,
        on_attach = function(_, bufnr)
          local nmap = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
          end

          nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
          nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
          nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
          nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
        end,
      })

      local servers = { "pyright", "gopls", "nil_ls", "lua_ls", "tinymist" }
      
      for _, server in ipairs(servers) do
        vim.lsp.enable(server)
      end
    end,
  },
}
