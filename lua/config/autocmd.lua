local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    if mark[1] > 1 and mark[1] <= vim.api.nvim_buf_line_count(0) then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})

autocmd("BufReadPre", {
  desc = "clear the last used search pattern",
  pattern = "*",
  callback = function()
    vim.fn.setreg("/", "") -- Clears the search register
    vim.cmd('let @/ = ""') -- Clear the search register using Vim command
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.server_capabilities.documentHighlightProvider then
      local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })
    end

    vim.api.nvim_create_autocmd("LspDetach", {
      group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
      callback = function(event2)
        vim.lsp.buf.clear_references()
        vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
      end,
    })

    local map = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end

    -- defaults:
    -- https://neovim.io/doc/user/news-0.11.html#_defaults

    map("<leader>df", vim.diagnostic.open_float, "Open [D]iagnostic [F]loat")
    map("<leader>dl", vim.diagnostic.setloclist, "Open [D]iagnostics [L]ist")

    map("H", vim.lsp.buf.hover, "Hover Documentation")
    map("gr", vim.lsp.buf.references, "[G]oto [R]eferences")
    map("gt", vim.lsp.buf.type_definition, "[G]oto [T]ype Definition")
    map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
    map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
    map("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementatio")
    map("<c-space>", vim.lsp.buf.code_action, "[C]ode [A]ction")
    map("<leader>cr", vim.lsp.buf.rename, "[C]ode [R]ename")
    map("<C-f>", vim.lsp.buf.format, "Format")

    map("gds", vim.lsp.buf.document_symbol, "[G]oto [D]ocument [S]ymbol")
    map("gws", vim.lsp.buf.workspace_symbol, "[G]oto [W]orkspace [S]ymbol")
  end,
})
