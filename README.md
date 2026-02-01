# Neovim Configuration

A custom Neovim configuration built from scratch, designed for Neovim 0.10+ with strict dependency management and clean architecture.

## Overview

This configuration is inspired by LazyVim's structure but built independently without using LazyVim itself. It focuses on:
- **Zero external build dependencies** - no Make, Rust, Node.js, or Go required
- **Pure Lua implementation** - all dependencies managed through lazy.nvim
- **Version pinning** - all plugins use semantic versioning (`^X.0`)
- **Clean structure** - modular organization with clear separation of concerns

## File Structure

```
~/.config/nvim/
├── init.lua                 # Entry point - bootstraps the configuration
├── lazy-lock.json           # Lockfile for reproducible plugin versions
└── lua/
    ├── config/              # Core configuration modules
    │   ├── lazy.lua         # Plugin manager bootstrap & setup
    │   ├── options.lua      # Editor options & UI configuration
    │   ├── keymaps.lua      # All keybindings (including LSP)
    │   └── autocmds.lua     # Autocommands
    └── plugins/             # Plugin specifications (one file per plugin/feature)
        ├── cmp.lua          # Completion configuration
        ├── colorscheme.lua  # Color scheme
        ├── copilot.lua      # GitHub Copilot
        ├── formatting.lua   # Code formatting (conform.nvim)
        ├── linting.lua      # Linting (nvim-lint)
        ├── lsp.lua          # LSP configuration & servers
        ├── neo-tree.lua     # File explorer
        ├── noice.lua        # UI enhancements
        ├── statusline.lua   # Status line
        ├── surround.lua     # Surround text objects
        ├── tabline.lua      # Buffer/tab line
        ├── telescope.lua    # Fuzzy finder
        └── which-key.lua    # Keybinding menu
```

## How It Works

### 1. Initialization Flow

```
init.lua
   └─> require("config.lazy")
          ├─> Bootstrap lazy.nvim (auto-install if missing)
          ├─> Set leader keys (Space & Backslash)
          ├─> Load config.options
          ├─> Load config.keymaps
          ├─> Load config.autocmds
          └─> Initialize lazy.nvim with plugin specs
```

**Step-by-step:**

1. **`init.lua`** - The entry point that simply calls `require("config.lazy")`
2. **`config/lazy.lua`** - Bootstraps the entire configuration:
   - Auto-installs lazy.nvim plugin manager if not present
   - Sets leader keys (`<Space>` and `<Backslash>`)
   - Loads core configuration modules (options, keymaps, autocmds)
   - Initializes lazy.nvim and tells it to load all plugins from `lua/plugins/`

### 2. Plugin Loading System

The configuration uses **lazy.nvim** as the plugin manager with automatic plugin discovery.

#### How Plugins Are Loaded

In `lua/config/lazy.lua`, this section handles plugin loading:

```lua
require("lazy").setup({
  spec = {
    { import = "plugins" },  -- Auto-import all files from lua/plugins/
  },
  -- ... additional config
})
```

The `{ import = "plugins" }` directive tells lazy.nvim to:
1. Scan the `lua/plugins/` directory
2. Load every `.lua` file it finds
3. Merge all plugin specifications together

#### Plugin File Structure

Each file in `lua/plugins/` returns a plugin specification (or array of specs):

```lua
-- Example: lua/plugins/telescope.lua
return {
  "nvim-telescope/telescope.nvim",  -- Plugin repository
  version = "^0.1",                 -- Semver version constraint
  dependencies = {                  -- Dependencies managed by lazy.nvim
    { "nvim-lua/plenary.nvim", version = "^0.1" }
  },
  cmd = "Telescope",                -- Lazy-load on command
  keys = {                          -- Lazy-load on keymap
    { "<leader><space>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
  },
  opts = {                          -- Plugin configuration
    -- options here
  },
}
```

**Lazy Loading Strategies:**
- `cmd = "CommandName"` - Load when command is first used
- `keys = { ... }` - Load when keybinding is pressed
- `ft = "filetype"` - Load for specific file types
- `event = "Event"` - Load on Vim events
- No lazy loading - Set `lazy = false` for immediate loading

### 3. Configuration Modules

#### `config/options.lua`
- Editor settings (line numbers, indentation, search, etc.)
- Diagnostic configuration (rounded borders, virtual text)
- LSP handler overrides for consistent UI

#### `config/keymaps.lua`
- All keybindings defined in one place
- Organized by functionality (navigation, LSP, windows, etc.)
- LSP keybindings set up here (not in plugin files)

#### `config/autocmds.lua`
- Autocommands for automatic behaviors
- Event-driven customizations

## Key Features

### LSP & Development Tools

**Language Servers** (via Mason):
- lua_ls (Lua)
- pyright (Python)
- vtsls (TypeScript/JavaScript)
- bashls (Bash)
- jsonls, html, cssls

**Formatters**:
- prettier (TS/JS/JSON/HTML/CSS)
- shfmt (Bash, 4-space indent)

**Linters**:
- eslint_d (TS/JS)
- shellcheck (Bash)

**Auto-installation**: `mason-tool-installer.nvim` handles formatters/linters automatically

### UI Enhancements
- Tokyo Night color scheme
- Rounded borders on all popups
- Custom diagnostic virtual text with `●` prefix
- File explorer (neo-tree)
- Fuzzy finder (telescope)
- Enhanced UI (noice)

### Format on Save
- Enabled with 500ms timeout
- Falls back to LSP if formatter unavailable
- Configured in `lua/plugins/formatting.lua`

## Installation

1. **Backup existing configuration:**
   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   mv ~/.local/share/nvim ~/.local/share/nvim.bak
   ```

2. **Clone this configuration:**
   ```bash
   git clone <your-repo-url> ~/.config/nvim
   ```

3. **Launch Neovim:**
   ```bash
   nvim
   ```
   
   On first launch:
   - lazy.nvim will auto-install itself
   - All plugins will be installed automatically
   - Mason will install LSP servers, formatters, and linters

4. **Verify installation:**
   ```vim
   :checkhealth
   :Mason
   :Lazy
   ```

## Essential Keybindings

**Leader keys:**
- `<leader>` = Space
- `<localleader>` = Backslash

**Core:**
- `jk` - Exit insert mode
- `<leader>l` - Lazy UI
- `<leader>cm` - Mason UI

**File Navigation:**
- `<leader>e` - Toggle file explorer
- `<leader><space>` - Find files
- `<leader>/` - Live grep
- `<leader>,` - Buffer picker

**Buffer Management:**
- `Shift+h/l` - Previous/next buffer
- `<leader>bd` - Delete buffer

**Window Management:**
- `<leader>w` + `hjkl` - Split windows
- `Ctrl+hjkl` - Navigate windows
- `<leader>wd` - Delete window

**LSP:**
- `gd` - Go to definition
- `gr` - Go to references
- `K` - Hover documentation
- `<leader>ca` - Code action
- `<leader>cr` - Rename
- `[d` / `]d` - Previous/next diagnostic

**Comments:**
- `gcc` - Toggle line comment
- `gc{motion}` - Comment with motion

**Surround:**
- `ys{motion}{char}` - Add surrounding
- `ds{char}` - Delete surrounding
- `cs{old}{new}` - Change surrounding

## Customization

### Adding a New Plugin

1. Create a new file in `lua/plugins/`:
   ```bash
   touch ~/.config/nvim/lua/plugins/my-plugin.lua
   ```

2. Add plugin specification:
   ```lua
   return {
     "author/plugin-name",
     version = "^1.0",
     opts = {
       -- configuration
     },
   }
   ```

3. Restart Neovim - lazy.nvim will auto-detect and install it

### Modifying Keybindings

Edit `lua/config/keymaps.lua` - all keybindings are centralized there.

### Changing Options

Edit `lua/config/options.lua` for editor settings.

## Design Principles

1. **No External Build Dependencies**: Only dependencies installable via lazy.nvim's `dependencies = {}` are allowed
2. **Version Pinning**: All plugins use semver pattern `^X.0` for stability
3. **Modular Structure**: One plugin per file for easy maintenance
4. **Lazy Loading**: Plugins load on-demand for fast startup
5. **Centralized Config**: Keymaps and options in dedicated files

## Troubleshooting

**Plugin won't install:**
- Check `:Lazy` for errors
- Verify no external build dependencies required
- Ensure version specification is valid

**LSP not working:**
- Run `:Mason` to check installed servers
- Verify server name matches lspconfig naming
- Check `:LspInfo` for active clients

**Slow startup:**
- Run `:Lazy profile` to identify slow plugins
- Ensure plugins use lazy loading where possible

**Formatting/linting issues:**
- Check `:ConformInfo` for formatter status
- Verify tools are installed in Mason
- Check `vim.lsp.buf.format()` for LSP formatting

## Requirements

- Neovim 0.10+
- Git (for lazy.nvim and plugin installation)
- Recommended: A Nerd Font for icons

## License

This configuration is provided as-is for personal use.
