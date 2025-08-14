-- lsp/angularls.lua
-- Make sure you have the angular language server installed
-- npm i -g @angular/language-server

return {
  cmd = { vim.fn.stdpath('config') .. '/scripts/ngserver-wrapper.sh' },
  filetypes = { 'typescript', 'html', 'typescriptreact', 'typescript.tsx' },
  root_markers = { 'angular.json', 'project.json' },
  settings = {
    angular = {
      log = 'verbose'
    }
  },
  init_options = {
    -- Enable Angular Language Service features
    angularLanguageService = true,
    -- Include TypeScript files in Angular language service
    includeGlobalTypeScriptFiles = true,
  },
  on_attach = function(client, bufnr)
    -- Disable semantic tokens if they cause issues
    client.server_capabilities.semanticTokensProvider = nil
    
    -- Set up buffer-specific keymaps for Angular
    local opts = { buffer = bufnr, silent = true }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  end,
}
