# Neovim Config Notes

## Structure

- Requires Neovim 0.11+; current configuration uses native LSP APIs: `vim.lsp.config()` and `vim.lsp.enable()`.
- `init.lua` sets options/autocmds, bootstraps `lazy.nvim`, then imports `lua/plugins/*.lua`.
- Plugin specifications live in `lua/plugins/`. Keep plugin changes minimal and let Lazy manage `lazy-lock.json`.
- Runtime LSP setup is `plugin/lsp.lua`. Individual native LSP definitions live in `lsp/<server>.lua` and are loaded dynamically.
- Shared mappings and options: `lua/vim-options.lua`. LSP buffer mappings and LSP lifecycle autocmds: `lua/config/autocmd.lua`.
- Diagnostic helpers: `:LspTest`, `:AngularLspDebug`, `:AngularLspRestart`.

## LSP And Monorepos

- Mason installs the standard configured servers. Do not add global npm requirements for Mason-managed servers.
- Angular is separate from Mason's automatic install list. `ngserver` must be on `PATH`; global `@angular/language-server` is a supported fallback.
- Preserve service-local roots for monorepos. Use the nearest service manifest/config before `.git`:
  - JS/TS, ESLint, Tailwind: `package.json` and tool configs.
  - PHP: `composer.json` or `.phpactor.json`.
  - Angular: `angular.json` or `project.json`.
  - Lua: `.luarc.json`, `.luarc.jsonc`, or `.nvim.lua`.
- Every explicitly configured server needs `cmd`, `filetypes`, and suitable roots. Do not rely on undeclared `nvim-lspconfig` defaults.
- Avoid forcing ESLint legacy or flat configuration. Let the server detect project configuration.

## Mapping Conventions

- Normal mode: `<C-b>`/`<C-f>` navigate jumplist back/forward. Do not reuse them for normal-mode plugin actions.
- Normal mode: `<C-h>`, `<C-j>`, `<C-k>`, `<C-l>` move windows; `J`/`K` move 20 lines.
- LSP maps are buffer-local. Use `H` for hover and `<leader>cf` for formatting.
- blink.cmp mappings are insert-mode. Its `<C-b>`/`<C-f>` completion-documentation bindings do not conflict with normal-mode jumplist mappings.
- Angular must use `H` for hover, matching general LSP behavior; preserve `<leader>at` template/style navigation.

## Documentation

- Update `README.md` whenever user-facing mappings, commands, LSPs, plugins, requirements, or feature status changes.
- Keep the README checklist truthful. Mark capability-dependent features with their limitation, such as formatting only when the attached server supports it.
- Keep `:LspTest` server and executable coverage aligned with the configured LSP list.

## Verification

Run after configuration changes:

```sh
nvim --headless -i NONE init.lua "+sleep 1000m" "+qa!"
nvim --headless -i NONE "+LspTest" "+qa!"
git diff --check
```

Do not overwrite unrelated changes in `lazy-lock.json` or elsewhere.
