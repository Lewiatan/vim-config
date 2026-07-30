-- LSP Configuration Test
-- Run with :lua require('lsp-test').test()

local M = {}

function M.test()
  print("=== LSP Configuration Test ===\n")
  
  -- Test loading all server configurations
  local servers = {
    "lua_ls", "cssls", "html", "emmet_language_server", 
    "ts_ls", "phpactor", "jsonls", "angularls", 
    "cucumber_language_server", "dockerls", "css_variables", "tailwindcss", "eslint"
  }
  
  for _, server in ipairs(servers) do
    local config_path = vim.fn.stdpath('config') .. '/lsp/' .. server .. '.lua'
    if vim.fn.filereadable(config_path) == 1 then
      local ok, config = pcall(dofile, config_path)
      if ok and type(config) == 'table' then
        print("✓ " .. server .. " configuration loaded successfully")
      else
        print("✗ " .. server .. " configuration failed to load: " .. tostring(config))
      end
    else
      print("- " .. server .. " configuration file not found")
    end
  end
  
  -- AngularLS must load both packages from the active workspace.
  print("\n=== Angular LSP Dependency Test ===")
  local angular_root = vim.fs.root(0, { "angular.json", "project.json" })
  if not angular_root then
    print("- Current buffer is not in an Angular workspace")
  else
    for _, package in ipairs({ "typescript", "@angular/language-service" }) do
      local path = angular_root .. "/node_modules/" .. package
      local marker = vim.fn.isdirectory(path) == 1 and "✓" or "✗"
      print(marker .. " " .. package .. ": " .. path)
    end
  end
  
  -- Test executables
  print("\n=== Executable Test ===")
  local executables = {
    "ngserver", "typescript-language-server", "vscode-html-language-server",
    "css-variables-language-server", "tailwindcss-language-server", "vscode-eslint-language-server"
  }
  
  for _, exe in ipairs(executables) do
    local path = vim.fn.exepath(exe)
    if path ~= "" then
      print("✓ " .. exe .. " found at: " .. path)
    else
      print("✗ " .. exe .. " not found in PATH")
    end
  end
  
  print("\n=== Test Complete ===")
end

return M
