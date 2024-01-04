return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {"lua", "vim", "vimdoc", "css", "diff", "dockerfile", "gitignore", "graphql", "html", "javascript", "jsdoc", "json", "php", "phpdoc", "regex", "typescript", "yaml", "xml"},
        sync_instsall = false,
        auto_install = true,
        additional_vim_regex_highlighting = false,
      })
    end
  }
}
