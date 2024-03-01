return {
  'numToStr/Comment.nvim',
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- import comment plugin safely
    local comment = require("Comment")
    -- enable comment
    comment.setup({
      toggler = {
        line = '<leader>/',
        block = '<leader>?'
      },
      opleader = {
        line = '<leader>/',
        block = '<leader>?'
      }
    })
  end,
}
