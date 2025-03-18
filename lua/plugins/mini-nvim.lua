return {
  { 
    'echasnovski/mini.ai',
    version = '*', 
    config = function() 
      require('mini.ai').setup()
    end,
  },
  { 
    'echasnovski/mini.comment',
    version = '*',
    config = function()
      require('mini.comment').setup()
    end,
  },
  { 
    'echasnovski/mini.pairs',
    version = '*', 
    config = function()
      require('mini.pairs').setup()
    end
  },
  {
    'echasnovski/mini.icons',
    version = '*',
    config = function()
      require('mini.icons').setup() 
    end
  },
  {
    'echasnovski/mini.snippets',
    version = '*',
    config = function()
      require('mini.snippets').setup()
    end
  },
  { 
    'echasnovski/mini.completion',
    version = '*',
    config = function()
      require('mini.completion').setup()
    end
  },
}
