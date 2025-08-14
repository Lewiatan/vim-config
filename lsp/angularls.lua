-- lsp/angularls.lua
-- Make sure you have the angular language server installed
-- npm i -g @angular/language-server

-- Build Angular command with TypeScript paths at module load time
local angular_cmd = { 'ngserver', '--stdio' }

-- Try to add TypeScript paths
local ok, ts_global = pcall(vim.fn.system, 'npm root -g')
if ok and ts_global then
  ts_global = ts_global:gsub('\n', '')
  local ts_path = ts_global .. '/typescript'
  
  if vim.fn.isdirectory(ts_path) == 1 then
    -- Set NODE_PATH to help Angular LS find TypeScript
    vim.env.NODE_PATH = (vim.env.NODE_PATH or '') .. ':' .. ts_global
    angular_cmd = {
      'ngserver',
      '--stdio',
      '--tsProbeLocations', ts_path,
      '--ngProbeLocations', ts_path
    }
  end
end

return {
  cmd = angular_cmd,
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
