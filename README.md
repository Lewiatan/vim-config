# Vim Config for PHP and JS/TS programming

## Requirements for vim functionality in order to make if IDE for PHP and JavaScript/TypeScript

- [x]  Package management (lazy)
- [x]  Fuzzy search (telescope)
- [x]  Project files tree view (nvim-tree)
- [x]  Syntax highlighting & indentation (treesitter)
- [x]  Color scheme
- [x]  LSP for php and js/ts/angular 
- [x]  Phpactor as a plugin
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
| Keybind | Function |
| ------- | -------- |
| `<M-h,j,k,l>` | Movie single line |
| `<M-h,j,k,l>` | (In visual mode) Movie selection |

### Split/join parameters
| Keybind | Function |
| ------- | -------- |
| `<gS>` | Toggle split/join |

### Surround motions
| Keybind | Function |
| ------- | -------- |
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

## LSP Configuration

### Configured Language Servers
- **lua_ls** - Lua Language Server
- **cssls** - CSS Language Server  
- **html** - HTML Language Server
- **emmet_language_server** - HTML Emmet support
- **ts_ls** - TypeScript/JavaScript Language Server
- **phpactor** - PHP Language Server
- **jsonls** - JSON Language Server
- **angularls** - Angular Language Server
- **cucumber_language_server** - Cucumber/Gherkin support
- **dockerls** - Docker Language Server
- **css_variables** - CSS Variables Language Server

### Custom LSP Commands

#### `:LspTest`
Tests all LSP configurations and checks if required executables are available.
- Validates each server configuration file
- Checks TypeScript paths for Angular LSP
- Verifies that language server executables are in PATH

#### `:AngularLspDebug`
Comprehensive Angular LSP diagnostic tool.
- Detects if you're in an Angular project (looks for `angular.json`)
- Shows active LSP clients
- Displays current buffer information
- Shows diagnostics breakdown by source

#### `:AngularLspRestart`
Restarts the Angular Language Server.
- Stops all Angular LSP clients
- Automatically restarts them after 1 second
- Useful when Angular LSP gets stuck or needs to reload project configuration

### LSP Keybindings (Angular Projects)
| Keybind | Function |
| ------- | -------- |
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Find references |
| `K` | Hover documentation |

### Installation Requirements

#### Required Global npm packages:
```bash
npm install -g @angular/language-server
npm install -g typescript-language-server
npm install -g typescript
npm install -g vscode-langservers-extracted
npm install -g css-variables-language-server
```

#### Neovim Version Compatibility
- **Tested with**: Neovim 0.12.0-dev
- **Minimum required**: Neovim 0.11+
- **LSP API**: Uses the new Neovim LSP configuration API (`vim.lsp.config`, `vim.lsp.enable`)
- **Angular LSP**: Uses simplified static configuration for better compatibility

### Angular LSP Configuration Notes

The Angular LSP uses a simplified configuration approach that:
- **Works reliably** across different Neovim versions
- **Uses global TypeScript** installation automatically
- **Managed separately** from Mason to avoid version conflicts
- **Starts with basic command** (`ngserver --stdio`) for maximum compatibility

### Troubleshooting

#### Angular LSP Issues
1. **Components not found**: Run `:AngularLspDebug` to check project detection and TypeScript paths
2. **LSP not starting**: Run `:AngularLspRestart` 
3. **TypeScript version conflicts**: Ensure TypeScript 5.0+ is installed globally

#### General LSP Issues
1. **Test all configurations**: `:LspTest`
2. **Check LSP health**: `:checkhealth lsp`
3. **View LSP logs**: `tail -f ~/.local/state/nvim/lsp.log`
4. **Restart all LSP clients**: `:LspRestart`

