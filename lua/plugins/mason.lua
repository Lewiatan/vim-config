return {
    {
      "williamboman/mason.nvim",
      lazy = false,
      config = function()
        require("mason").setup()
      end
    },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
  },
}

