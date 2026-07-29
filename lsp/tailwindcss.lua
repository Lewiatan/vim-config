return {
  cmd = { "tailwindcss-language-server", "--stdio" },
  filetypes = {
    "html",
    "css",
    "scss",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "vue",
    "svelte"
  },
  root_markers = {
    "tailwind.config.js",
    "tailwind.config.cjs",
    "tailwind.config.mjs",
    "tailwind.config.ts",
    "postcss.config.js",
    "postcss.config.cjs",
    "postcss.config.mjs",
    "postcss.config.ts",
    "package.json",
    ".git"
  },
  settings = {
    tailwindCSS = {
      lint = {
        cssConflict = "warning",
        invalidApply = "error",
        invalidConfigPath = "error",
        invalidScreen = "error",
        invalidTailwindDirective = "error",
        invalidVariant = "error",
        recommendedVariantOrder = "warning"
      },
      experimental = {
        classRegex = {
          -- Enable class detection in template literals, clsx, classNames, etc.
          "tw`([^`]*)",
          "tw=\"([^\"]*)",
          "tw={\"([^\"}]*)",
          "tw\\.\\w+`([^`]*)",
          {"clsx\\(([^)]*)\\)", "(?:'|\"|`)([^(?:'|\"|`)]*)(?:'|\"|`)"},
          {"classnames\\(([^)]*)\\)", "(?:'|\"|`)([^(?:'|\"|`)]*)(?:'|\"|`)"},
          {"cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]"},
          {"cn\\(([^)]*)\\)", "(?:'|\"|`)([^(?:'|\"|`)]*)(?:'|\"|`)"}
        }
      },
      validate = true
    }
  },
  on_attach = function(client, bufnr)
    -- Disable hover in favor of TypeScript hover for .tsx/.jsx files
    if vim.bo[bufnr].filetype == "typescriptreact" or vim.bo[bufnr].filetype == "javascriptreact" then
      client.server_capabilities.hoverProvider = false
    end
  end
}
