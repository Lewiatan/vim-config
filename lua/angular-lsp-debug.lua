-- Angular LSP Debug Helper
-- Run this in Neovim with :lua require('angular-lsp-debug').check()

local M = {}

function M.check()
  print("=== Angular LSP Diagnostic ===")
  
  -- Check if we're in an Angular project
  local angular_config = vim.fs.find({'angular.json'}, {upward = true})[1]
  if angular_config then
    print("✓ Angular project detected: " .. angular_config)
  else
    print("✗ No angular.json found - not an Angular project")
    return
  end
  
  -- Check LSP clients
  local clients = vim.lsp.get_clients()
  print("\n=== Active LSP Clients ===")
  for _, client in ipairs(clients) do
    print("- " .. client.name .. " (ID: " .. client.id .. ")")
    if client.name == "angularls" then
      print("  ✓ Angular LSP is running")
      print("  Root dir: " .. (client.config.root_dir or "unknown"))
      print("  Filetypes: " .. table.concat(client.config.filetypes or {}, ", "))
    end
  end
  
  -- Check current buffer
  local bufnr = vim.api.nvim_get_current_buf()
  local filetype = vim.api.nvim_get_option_value('filetype', { buf = bufnr })
  local filename = vim.api.nvim_buf_get_name(bufnr)
  
  print("\n=== Current Buffer ===")
  print("File: " .. filename)
  print("Filetype: " .. filetype)
  
  local buffer_clients = vim.lsp.get_clients({bufnr = bufnr})
  print("LSP clients for this buffer:")
  for _, client in ipairs(buffer_clients) do
    print("- " .. client.name)
  end
  
  -- Check diagnostics
  local diagnostics = vim.diagnostic.get(bufnr)
  print("\n=== Diagnostics ===")
  print("Total diagnostics: " .. #diagnostics)
  
  local by_source = {}
  for _, diagnostic in ipairs(diagnostics) do
    local source = diagnostic.source or "unknown"
    by_source[source] = (by_source[source] or 0) + 1
  end
  
  for source, count in pairs(by_source) do
    print("- " .. source .. ": " .. count)
  end
end

return M
