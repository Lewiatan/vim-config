return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local languages = {
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
        "tsx",
        "yaml",
        "xml",
        "markdown",
      }

      require("nvim-treesitter").install(languages)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = languages,
        callback = function()
          pcall(vim.treesitter.start)
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
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
