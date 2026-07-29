local servers = {
  "lua_ls",                -- Lua
  "cssls",                 -- CSS
  "html",                  -- HTML
  "emmet_language_server", -- HTML Emmet
  "ts_ls",                 -- Typescript/javascript
  "phpactor",              -- PHP
  'jsonls',
  'cucumber_language_server',
  'dockerls',
  'css_variables',
  'tailwindcss',           -- Tailwind CSS
  'eslint'                 -- ESLint for React
}

-- Add Angular manually (not managed by Mason)
local angular_servers = { 'angularls' }
local all_servers = vim.list_extend(vim.deepcopy(servers), angular_servers)

-- Load individual server configurations (including Angular)
for _, server in ipairs(all_servers) do
  local config_path = vim.fn.stdpath('config') .. '/lsp/' .. server .. '.lua'
  if vim.fn.filereadable(config_path) == 1 then
    local server_config = dofile(config_path)
    if server_config then
      vim.lsp.config(server, server_config)
    end
  end
end

vim.lsp.enable(all_servers)

local capabilities = require("blink.cmp").get_lsp_capabilities(nil, true)
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

vim.lsp.config("*", {
  capabilities = capabilities,
  root_markers = { ".git" },
  handlers = {
    -- Handle missing workspace/diagnostic/refresh method
    ['workspace/diagnostic/refresh'] = function()
      -- Just return nil, this is a harmless request
      return nil
    end,
  },
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

-- Angular LSP utilities
vim.api.nvim_create_user_command('AngularLspRestart', function()
  local clients = vim.lsp.get_clients({name = 'angularls'})
  for _, client in ipairs(clients) do
    client.stop()
    print('Stopped Angular LSP client')
  end
  
  -- Wait a moment then restart
  vim.defer_fn(function()
    vim.cmd('edit') -- Refresh the buffer to trigger LSP
    print('Angular LSP should restart automatically')
  end, 1000)
end, {})

vim.api.nvim_create_user_command('AngularLspDebug', function()
  require('angular-lsp-debug').check()
end, {})

vim.api.nvim_create_user_command('LspTest', function()
  require('lsp-test').test()
end, {})
