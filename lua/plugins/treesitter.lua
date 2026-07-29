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
        ensure_installed = {
          "lua",
          "vim",
          "vimdoc",
          "css",
          "diff",
          "dockerfile",
          "gitignore",
          "graphql",
          "html",
          "javascript",
          "typescript",
          "jsdoc",
          "json",
          "php",
          "phpdoc",
          "regex",
          "typescript",
          "tsx",
          "yaml",
          "xml",
          "markdown"
        },
        sync_install = false,
        additional_vim_regex_highlighting = false,
      })
    end
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup({
        enable = true,
        filetypes = {
          "html",
          "javascript",
          "typescript",
          "tsx",
          "jsx",
          "css",
          "lua",
          "xml",
          "php",
          "markdown",
        },
      })
    end
  }
}
