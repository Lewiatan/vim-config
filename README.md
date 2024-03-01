# Vim Config for PHP and JS/TS programming

## Requirements for vim functionality in order to make if IDE for PHP and JavaScript/TypeScript

- [x]  Package management (lazy)
- [x]  Fuzzy search (telescope)
- [x]  Project files tree view (nvim-tree)
- [x]  Syntax highlighting & indentation (treesitter)
- [x]  Color scheme
- [x]  LSP for php and js 
- [ ]  Phpactor as a plugin?
- [ ]  Support for refactoring actions:
    - [ ]  Extract method
    - [ ]  Extract variable/constsant
    - [x]  Rename method/variable/constant
    - [ ]  Move up/down code lines
    - [ ]  Comment/uncomment line/selection
- [ ]  Code generation:
    - [x]  Create blank classes/interfaces
    - [ ]  Implement methods from parent interface/abstract
- [x]  Local file history (undo tree)
- [x]  Github support (lazy git)
- [ ]  Database interface (nvim-dbee or vim-dadbod-ui)
- [ ]  Code folding
- [ ]  Code formatting

## Plugins to implement:
- <https://github.com/stevearc/dressing.nvim>
- <https://github.com/nvim-treesitter/nvim-treesitter-textobjects> (for swapping functions and parameters at the beggining)
- <https://github.com/kylechui/nvim-surround>
- <https://github.com/mfussenegger/nvim-lint> (? maybe it's not needed due to cmp and lsp)
- <https://github.com/stevearc/conform.nvim> (? maybe not needed due to cmp and lsp)
- <https://github.com/josean-dev/dev-environment-files/blob/main/.config/nvim/lua/josean/plugins/auto-session.lua>
- <https://github.com/ThePrimeagen/refactoring.nvim>
- <https://github.com/nvimtools/none-ls.nvim>


## vim-surround usage
The three "core" operations of `add`/`delete`/`change` can be done with the
keymaps `ys{motion}{char}`, `ds{char}`, and `cs{target}{replacement}`,
respectively. For the following examples, `*` will denote the cursor position:

```help
    Old text                    Command         New text
--------------------------------------------------------------------------------
    surr*ound_words             ysiw)           (surround_words)
    *make strings               ys$"            "make strings"
    [delete ar*ound me!]        ds]             delete around me!
    remove <b>HTML t*ags</b>    dst             remove HTML tags
    'change quot*es'            cs'"            "change quotes"
    <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
    delete(functi*on calls)     dsf             function calls
```

Detailed information on how to use this plugin can be found in
[`:h nvim-surround.usage`](https://github.com/kylechui/nvim-surround/blob/main/doc/nvim-surround.txt).

