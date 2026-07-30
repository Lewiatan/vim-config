local angular_root_markers = { 'angular.json', 'project.json' }

local function angular_node_modules(root)
  local node_modules = root .. '/node_modules'
  if vim.fn.isdirectory(node_modules .. '/typescript') == 1
      and vim.fn.isdirectory(node_modules .. '/@angular/language-service') == 1 then
    return node_modules
  end
end

return {
  cmd = function(dispatchers, config)
    local node_modules = angular_node_modules(config.root_dir)
    return vim.lsp.rpc.start({
      'ngserver',
      '--stdio',
      '--tsProbeLocations', node_modules,
      '--ngProbeLocations', node_modules,
    }, dispatchers, { cwd = config.root_dir })
  end,
  filetypes = { 'typescript', 'html', 'typescriptreact', 'typescript.tsx' },
  root_dir = function(bufnr, on_dir)
    local root = vim.fs.root(bufnr, angular_root_markers)
    if not root then
      return
    end

    if angular_node_modules(root) then
      on_dir(root)
      return
    end

    vim.notify(
      'AngularLS skipped: install workspace dependencies including typescript and @angular/language-service',
      vim.log.levels.WARN
    )
  end,
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
