-- lsp/angularls.lua
-- Make sure you have the angular language server installed
-- npm i -g @angular/language-server

-- Build Angular command with TypeScript paths at module load time
local angular_cmd = { 'ngserver', '--stdio' }

-- Try to add TypeScript paths
local ok, ts_global = pcall(vim.fn.system, 'npm root -g')
if ok and ts_global then
  ts_global = ts_global:gsub('\n', '')
  local ts_path = ts_global
  
  if vim.fn.isdirectory(ts_path .. '/typescript') == 1 then
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
      log = 'verbose',
      -- Enable template navigation features
      enableTemplateNavigation = true,
      -- Support for external templates
      externalTemplates = true,
    }
  },
  init_options = {
    -- Enable Angular Language Service features
    angularLanguageService = true,
    -- Include TypeScript files in Angular language service
    includeGlobalTypeScriptFiles = true,
    -- Enable template file navigation
    enableTemplateFileNavigation = true,
    -- Enable component-template linking
    enableComponentTemplateNavigation = true,
  },
  on_attach = function(client, bufnr)
    -- Disable semantic tokens if they cause issues
    client.server_capabilities.semanticTokensProvider = nil
    
    -- Custom function to navigate to templateUrl
    local function goto_template_file()
      local current_line = vim.api.nvim_get_current_line()
      local template_pattern = "templateUrl%s*:%s*['\"]([^'\"]+)['\"]"
      local style_pattern = "styleUrls?%s*:%s*%[?[^%]]*['\"]([^'\"]+)['\"]"
      
      local template_file = current_line:match(template_pattern)
      local style_file = current_line:match(style_pattern)
      
      local target_file = template_file or style_file
      
      if target_file then
        -- Get the directory of current file
        local current_file = vim.api.nvim_buf_get_name(bufnr)
        local current_dir = vim.fn.fnamemodify(current_file, ':h')
        local full_path = current_dir .. '/' .. target_file
        
        -- Check if file exists and open it
        if vim.fn.filereadable(full_path) == 1 then
          vim.cmd('edit ' .. vim.fn.fnameescape(full_path))
        else
          print('Template file not found: ' .. full_path)
        end
      else
        -- Fallback to regular LSP go to definition
        vim.lsp.buf.definition()
      end
    end
    
    -- Set up buffer-specific keymaps for Angular
    local opts = { buffer = bufnr, silent = true }
    vim.keymap.set('n', 'gd', goto_template_file, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'H', vim.lsp.buf.hover, opts)
    
    -- Additional Angular-specific keybindings
    vim.keymap.set('n', '<leader>at', goto_template_file, { buffer = bufnr, silent = true, desc = 'Go to Angular template' })
  end,
}
