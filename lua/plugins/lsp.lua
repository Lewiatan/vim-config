return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = false,
    config = function()
      local lsp_zero = require('lsp-zero')

      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({ buffer = bufnr })
      end)
    end

  },
  {
    'williamboman/mason.nvim',
    lazy = false,
    config = function()
      require('mason').setup({})
    end
  },
  {
    -- to learn how to use mason.nvim with lsp-zero
    -- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md

    'williamboman/mason-lspconfig.nvim',
    lazy = false,
    config = function()
      local lsp_zero = require('lsp-zero')
      require('mason-lspconfig').setup({
        handlers = {
          lsp_zero.default_setup,
        }
      })
    end
  },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/nvim-cmp' },
  { 'L3MON4D3/LuaSnip' },
  {
    'neovim/nvim-lspconfig',
    lazy = false,
  },
}
