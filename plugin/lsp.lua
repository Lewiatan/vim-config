local servers = {
  "lua_ls", -- Lua
  "cssls", -- CSS
  "emmet_language_server", -- HTML
  "ts_ls", -- Typescript/javascript
  "phpactor", -- PHP
        'jsonls',
        'angularls',
        'cucumber_language_server'
}

vim.lsp.enable(servers)

vim.lsp.config("*", {
  capabilities = require("blink.cmp").get_lsp_capabilities(nil, true),
  root_markers = { ".git" },
})

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = servers
})

vim.diagnostic.config({
    virtual_lines = true,
    -- virtual_text = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.WARN] = "WarningMsg",
        },
    },
})
-- require("lazydev").setup({
--   library = {
--     -- Load luvit types when the `vim.uv` word is found
--     { path = "${3rd}/luv/library", words = { "vim%.uv" } },
--   },
-- })

