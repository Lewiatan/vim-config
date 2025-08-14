-- LSP Configuration Test
-- Run with :lua require('lsp-test').test()

local M = {}

function M.test()
  print("=== LSP Configuration Test ===\n")
  
  -- Test loading all server configurations
  local servers = {
    "lua_ls", "cssls", "html", "emmet_language_server", 
    "ts_ls", "phpactor", "jsonls", "angularls", 
    "cucumber_language_server", "dockerls", "css_variables"
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
  
  -- Test Angular-specific paths
  print("\n=== Angular LSP Path Test ===")
  local ts_global = vim.fn.system("npm root -g"):gsub("\n", "")
  print("Global npm modules: " .. ts_global)
  
  local ts_lib = ts_global .. "/typescript/lib"
  if vim.fn.isdirectory(ts_lib) == 1 then
    print("✓ TypeScript library found at: " .. ts_lib)
  else
    print("✗ TypeScript library not found at: " .. ts_lib)
  end
  
  -- Test executables
  print("\n=== Executable Test ===")
  local executables = {
    "ngserver", "typescript-language-server", "vscode-html-language-server",
    "css-variables-language-server"
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
