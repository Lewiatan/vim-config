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
      require('mini.pairs').setup({
        mappings = {
          ['<'] = { action = 'open', pair = '<>', neigh_pattern = '[^\\].' },
          ['>'] = { action = 'close', pair = '<>', neigh_pattern = '[^\\].' },
        },
      })
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
    'echasnovski/mini.move',
    version = '*',
    config = function()
      require('mini.move').setup() 
    end
  },
  {
    'echasnovski/mini.splitjoin',
    version = '*',
    config = function()
      require('mini.splitjoin').setup() 
    end
  },
  {
    'echasnovski/mini.surround',
    version = '*',
    config = function()
      require('mini.surround').setup() 
    end
  },
  {
    'echasnovski/mini.cursorword',
    version = '*',
    config = function()
      require('mini.cursorword').setup() 
    end
  },
  -- {
  --   'echasnovski/mini.snippets',
  --   version = '*',
  --   config = function()
  --     require('mini.snippets').setup()
  --   end
  -- },
  -- { 
  --   'echasnovski/mini.completion',
  --   version = '*',
  --   config = function()
  --     require('mini.completion').setup()
  --   end
  -- },
}
