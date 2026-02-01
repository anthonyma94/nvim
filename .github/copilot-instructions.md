# Neovim Configuration Instructions

## Overview
This is a custom Neovim configuration built from scratch, inspired by LazyVim's structure but without using LazyVim itself. It's designed for Neovim 0.10+ with strict dependency management.

## Core Principles

### Dependency Rules
- **NO external build dependencies** (no Make, Rust, Node.js, Go, etc.)
- Only dependencies installable via lazy.nvim's `dependencies = {}` key are allowed
- All plugins must be version pinned using semver pattern: `version = "^X.0"`
- Prefer pure Lua implementations when available

### Structure
```
init.lua                      # Entry point, loads config.lazy
lua/
  config/
    lazy.lua                  # Bootstrap lazy.nvim, set leaders, load plugins
    options.lua               # Editor options, diagnostic/LSP UI config
    keymaps.lua              # All keybindings including LSP
    autocmds.lua             # Autocommands (currently empty)
  plugins/
    *.lua                    # Each file returns plugin spec(s)
```

## Key Configuration Details

### Plugin Manager
- **lazy.nvim**: Auto-bootstraps on first run
- Leader keys: Space (mapleader), Backslash (maplocalleader)
- Plugins auto-load from `lua/plugins/` directory

### Important Version Notes
- Mason plugins moved from `williamboman/*` to `mason-org/*`
- Mini plugins moved from `echasnovski/*` to `nvim-mini/*`
- TypeScript LSP: Use `vtsls` (not `ts_ls` or `tsserver`)
- LSP server names: Use lspconfig names in mason-lspconfig's `ensure_installed`

### LSP & Tooling Setup
**LSP Servers** (via mason-lspconfig):
- lua_ls, pyright, vtsls, bashls, jsonls, html, cssls

**Formatters** (via conform.nvim + mason-tool-installer):
- prettier (TypeScript/JavaScript/JSON/HTML/CSS)
- shfmt (Bash - configured with `-i 4` for 4 spaces)

**Linters** (via nvim-lint + mason-tool-installer):
- eslint_d (TypeScript/JavaScript)
- shellcheck (Bash)

**Auto-installation**: mason-tool-installer.nvim handles formatters/linters

### UI Enhancements
- All LSP/diagnostic popups use rounded borders
- Diagnostic virtual text uses `●` prefix with 4-space spacing
- Mason UI has rounded borders
- Tokyo Night colorscheme (lazy=false, priority=1000)

### Key Keybindings

**Core:**
- `jk` - Exit insert mode
- `<leader>l` - Lazy UI
- `<leader>cm` - Mason UI

**File Explorer (neo-tree):**
- `<leader>e` - Toggle file explorer
- Auto-closes when opening a file

**Fuzzy Finding (telescope):**
- `<leader><space>` - Find files
- `<leader>,` - Buffer picker
- `<leader>/` - Live grep
- `<leader>`` - Jump to alternate buffer

**Buffer Navigation:**
- `Shift+h/l` - Previous/next buffer
- `<leader>bd` - Delete buffer

**Window Management:**
- `<leader>w` + `hjkl` - Split windows
- `Ctrl+hjkl` - Navigate between windows
- `<leader>wd` - Delete window

**LSP:**
- `gd` - Go to definition
- `gr` - Go to references
- `gI` - Go to implementation
- `K` - Hover documentation
- `<leader>ca` - Code action
- `<leader>cr` - Rename
- `<leader>cd` - Show line diagnostics popup
- `[d` / `]d` - Previous/next diagnostic

**Surround (mini.surround - vim-surround style):**
- `ys{motion}{char}` - Add surrounding (e.g., `ysiw"`)
- `ds{char}` - Delete surrounding (e.g., `ds"`)
- `cs{old}{new}` - Change surrounding (e.g., `cs"'`)

**Comments:**
- `gcc` - Toggle line comment (built-in Neovim 0.10+)
- `gc{motion}` - Comment with motion
- `gc` in visual mode - Comment selection

### Formatting & Linting
- **Format on save**: Enabled with 500ms timeout, LSP fallback
- **Lint triggers**: On save, buffer enter, leaving insert mode
- **shfmt config**: 4 spaces indentation via `prepend_args = { "-i", "4" }`

### Special Configurations
**options.lua:**
- `vim.deprecate = function() end` - Suppresses plugin deprecation warnings
- Custom diagnostic config with rounded borders
- LSP handler override for consistent rounded borders

**which-key groups:**
- Configured with key groups for f/g/s/u/c/b/w/q/x/tab

## Troubleshooting

### Common Issues
1. **LSP server not found**: Check Mason package name vs lspconfig name
2. **Plugin won't install**: Verify no external build dependencies required
3. **Version conflicts**: Ensure semver pattern `^X.0` is used
4. **TypeScript LSP errors**: Use `vtsls`, not `ts_ls`

### Verification Steps
1. Run `:checkhealth` to verify setup
2. Run `:Mason` to check installed tools
3. Run `:Lazy` to verify plugin status
4. Check `:messages` for errors on startup

## Plugin List
- folke/lazy.nvim - Plugin manager
- folke/tokyonight.nvim - Colorscheme
- folke/which-key.nvim - Keybinding menu
- nvim-neo-tree/neo-tree.nvim - File explorer
- nvim-mini/mini.tabline - Buffer tabs
- nvim-mini/mini.surround - Surround manipulation
- nvim-telescope/telescope.nvim - Fuzzy finder
- mason-org/mason.nvim - Tool installer
- mason-org/mason-lspconfig.nvim - LSP bridge
- WhoIsSethDaniel/mason-tool-installer.nvim - Auto-install tools
- neovim/nvim-lspconfig - LSP configuration
- stevearc/conform.nvim - Formatting
- mfussenegger/nvim-lint - Linting

## Future Considerations
- Treesitter for syntax highlighting (if needed)
- Completion plugin like nvim-cmp (if needed)
- Additional language servers as requirements grow
- More editor options in options.lua
