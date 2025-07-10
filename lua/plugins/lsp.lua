local servers = {
  'phpactor',
  'cssls',
  'emmet_language_server',
  'lua_ls',
  'ts_ls',
  'jsonls',
  'angularls',
  'cucumber_language_server',
}

return {
  {
    'saghen/blink.cmp',
    version = '1.*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
      -- 'super-tab' for mappings similar to vscode (tab to accept)
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      --
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      --
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = { preset = 'default' },

      appearance = {
        nerd_font_variant = 'mono'
      },

      -- (Default) Only show the documentation popup when manually triggered
      completion = { documentation = { auto_show = false } },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
      -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
      -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
      --
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  },
  {
    "mason-org/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
      ensure_installed = servers,
      eutomatic_enable = {
        exclude = {
          "phpactor"
        }
      }
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { 'saghen/blink.cmp' },
    lazy = false,
    config = function()
      local lspconfig = require ('lspconfig')
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      for key, server in pairs(servers) do
        -- passing config.capabilities to blink.cmp merges with the capabilities in your
        -- `opts[server].capabilities, if you've defined it
        lspconfig[server].setup(capabilities)
      end
      
      lspconfig.phpactor.setup {
        settings = {
          ["phpactor"] = {
root_markers = {".phpactor"}
          }
        }
      }

      vim.keymap.set("n", "H", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
      vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, {})
      vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, {})
      vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, {})
      vim.keymap.set({ 'n', 'x' }, '<C-f>', function() vim.lsp.buf.format({ async = true }) end, {})
    end,
  }
}
