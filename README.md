# Vim Config for PHP and JS/TS programming

## Requirements for vim functionality in order to make if IDE for PHP and JavaScript/TypeScript

- [x]  Package management (lazy)
- [x]  Fuzzy search (telescope)
- [x]  Project files tree view (nvim-tree)
- [x]  Syntax highlighting & indentation (treesitter)
- [x]  Color scheme
- [x]  LSP for php and js (lsp-zero)
- [ ]  Phpactor as a plugin?
- [ ]  Support for refactoring actions:
    - [ ]  Extract method
    - [ ]  Extract variable/constsant
    - [ ]  Rename method/variable/constant
    - [ ]  Move up/down code lines
    - [ ]  Comment/uncomment line/selection
- [ ]  Code generation:
    - [x]  Create blank classes/interfaces
    - [ ]  Implement methods from parent interface/abstract
- [x]  Local file history (undo tree)
- [x]  Github support (lazy git)
- [ ]  Database interface (nvim-dbee or vim-dadbod-ui)

## Plugins to implement:
- <https://github.com/numToStr/Comment.nvim>
- <https://neovimcraft.com/plugin/NvChad/nvim-colorizer.lua>
- <https://github.com/stevearc/dressing.nvim>
- <https://github.com/nvim-treesitter/nvim-treesitter-textobjects> (for swapping functions and parameters at the beggining)
- <https://github.com/kylechui/nvim-surround>
- <https://github.com/windwp/nvim-autopairs>
- <https://github.com/mfussenegger/nvim-lint> (? maybe it's not needed due to cmp and lsp)
- <https://github.com/lewis6991/gitsigns.nvim>
- <https://github.com/stevearc/conform.nvim> (? maybe not needed due to cmp and lsp)
- <https://github.com/josean-dev/dev-environment-files/blob/main/.config/nvim/lua/josean/plugins/auto-session.lua>
- <https://github.com/nvim-treesitter/nvim-treesitter-context>
