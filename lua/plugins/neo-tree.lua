return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      event_handlers = {
        {
          event = "file_opened",
          handler = function(file_path)
            require("neo-tree.command").execute({ action = "close" })
          end
        },
      },
      filesystem = {
        hide_dotfiles = false,
        always_show = {
          ".gitignore", ".env"
        }
      },
      window = {
        position = "right",
        mappings = {
          ["l"] = "toggle_node",
          ["s"] = "open_split",
          ["v"] = "open_vsplit",
          ["h"] = "close_node",
          ["H"] = "close_all_nodes"
        }
      }
    })

    vim.keymap.set("n", "<leader>e", ":Neotree reveal<CR>", {})
    vim.keymap.set("n", "<leader>fb", ":Neotree buffers reveal float<CR>", {})
  end,
}
