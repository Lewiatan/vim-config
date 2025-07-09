# Vim Config for PHP and JS/TS programming

## Requirements for vim functionality in order to make if IDE for PHP and JavaScript/TypeScript

- [x]  Package management (lazy)
- [ ]  Fuzzy search (telescope)
- [x]  Project files tree view (nvim-tree)
- [ ]  Syntax highlighting & indentation (treesitter)
- [x]  Color scheme
- [ ]  LSP for php and js 
- [ ]  Phpactor as a plugin?
- [ ]  Support for refactoring actions:
    - [ ]  Extract method
    - [ ]  Extract variable/constsant
    - [ ]  Rename method/variable/constant
    - [ ]  Move up/down code lines
    - [ ]  Comment/uncomment line/selection
- [ ]  Code generation:
    - [ ]  Create blank classes/interfaces
    - [ ]  Implement methods from parent interface/abstract
- [x]  Local file history (undo tree)
- [x]  Github support (lazy git)
- [ ]  Database interface (nvim-dbee or vim-dadbod-ui)
- [ ]  Code folding
- [ ]  Code formatting
- [ ]  Go back (ctrl - backspace in storm)
- [ ]  List methods and properties in class (Ctrl - E in storm)

## Plugins to implement:
- <https://github.com/nvim-treesitter/nvim-treesitter-textobjects> (for swapping functions and parameters at the beggining)
- <https://github.com/mfussenegger/nvim-lint> (? maybe it's not needed due to cmp and lsp)
- <https://github.com/stevearc/conform.nvim> (? maybe not needed due to cmp and lsp)
- <https://github.com/josean-dev/dev-environment-files/blob/main/.config/nvim/lua/josean/plugins/auto-session.lua>
- <https://github.com/ThePrimeagen/refactoring.nvim>
- <https://github.com/nvimtools/none-ls.nvim>
- <https://github.com/kevinhwang91/nvim-ufo>
- <https://github.com/cshuaimin/ssr.nvim>
- <https://github.com/HiPhish/rainbow-delimiters.nvim>
- <https://github.com/rcarriga/nvim-notify>
- <https://github.com/folke/noice.nvim> just for reference, but rather not to use
- <https://github.com/YacineDo/mc.nvim>
- <https://github.com/echasnovski/mini.nvim> - a way to go?
- <https://github.com/karb94/neoscroll.nvim>
- <https://github.com/folke/snacks.nvim> - replacement for some older plugins like `dressing`

## Useful keybindings
### Window
| Keybind | Function |
| ------- | -------- |
| `<C-w><C-s>` | Split horizontally | 
| `<C-w><C-v>` | Split vertically |
| `<C-h,j,k,l>` | Move around splits |

### File searching
| Keybind | Function |
| ------- | -------- |
| `<leader>ff` | Find files |
| `<leader>fr` | Find recent | 
| `<leader>fg` | Find grep | 
| In telescope |
| `<C-j,k>` | Select prex, next |

### Code comments
| Keybind | Function |
| ------- | -------- |
| `gcc` | Line comment |
| `gc` | Block comment (in visual mode) |
| `dgc` | Delete whole comment block |
`gc` also works with words motions like `gcw`, `gcap`, `gc{` and so on

### Move code
| `<M-hjkl>` | Movie single line |
| `<M-hjkl>` | (In visual mode) Movie selection |

### Split/join parameters
| `<gS>` | Toggle split/join |

### Surround motions
| `sa` | Surround around motion |
| `sd` | Delete around motion |
| `sr` | Replace around motion |
| `sf` | Find around motion |
| `sh` | Highlight around motion |
| `n`/`l` | Next/Last suffixes for forward/backward (ex. `shn)` higlights next pair `()`) |

### Lazy Git
| Keybind | Function |
| ------- | -------- |
| `<leader>gg` | Open Lazy Git |

<!-- ### LSP -->
<!-- | Keybind | Function | -->
<!-- | ------- | -------- | -->
<!-- | `<C-q>` | Open docs | -->
<!-- | `<C-b>` | Scroll docs up | -->
<!-- | `<C-f>` | Scroll docs down | -->
<!-- | `<C-Space>` | Complete code | -->
<!-- | `<C-e>` | Abort | -->
<!-- | `<CR>` | Confirm mapping | -->
<!-- | `<C-j>` | Select next mapping | -->
<!-- | `<C-k>` | Select prev mapping | -->
<!-- | `H` | Hover | -->
<!-- | `gd` | Go to definition | -->
<!-- | `gD` | Go to declaration | -->
<!-- | `gr` | Go to references | -->
<!-- | `gi` | Go to implementation | -->
<!-- | `go` | Go to type definition | -->
<!-- | `gs` | Go to signature help | -->
<!-- | `<leader>ca` | Code actions | -->
<!-- | `<leader>cr` | Rename | -->
<!-- | `<C-f>` | Format | -->

### NeoTree
| Keybind | Function |
| ------- | -------- |
| `<leader>e` | Open |
| `<leader>fb` | Open buffers |
| In tree view |
| `l` | Toggle node |
| `h` | Close node |
| `H` | Close all nodes |
| `s` | Open split horizontally |
| `v` | Open split vertically |
| `?` | Toggle hidden |
| `<esc>`,`q` | Close window |

### UndoTree
| Keybind | Function |
| ------- | -------- |
| `<leader>lh` | Open |

