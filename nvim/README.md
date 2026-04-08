# Neovim Configuration

A modern Neovim setup built on **lazy.nvim** with full LSP support, autocompletion, fuzzy finding, git integration, and multiple theme options.

## Requirements

- **Neovim** >= 0.10
- **Git**
- **Node.js** (for LSP servers and prettier)
- **Go** (for gopls and Go tooling)
- **ripgrep** (for Telescope live grep)
- **A Nerd Font** (for icons)
- **tmux** (optional, for sessionizer)
- **lazygit** (optional, for git TUI)
- **SDKMAN** (optional, for Java/jdtls)

## Installation

```bash
# Back up existing config
mv ~/.config/nvim ~/.config/nvim.bak

# Clone this config
git clone current-repo ~/.config/nvim

# Launch Neovim — lazy.nvim will bootstrap and install all plugins automatically
nvim
```

Mason will auto-install LSP servers and formatters on first launch. Run `:Mason` to check status.

## Structure

```
~/.config/nvim/
├── init.lua                    # Entry point
├── lua/
│   ├── config/
│   │   ├── lazy.lua            # Plugin manager bootstrap
│   │   ├── keymaps.lua         # Global keybindings
│   │   └── options.lua         # Editor settings
│   └── plugins/
│       ├── lsp/
│       │   ├── lspconfig.lua   # LSP servers & keybindings
│       │   ├── mason.lua       # LSP/tool auto-installer
│       │   ├── conform.lua     # Code formatting
│       │   ├── java.lua        # Java (jdtls) setup
│       │   └── lsp-lens.lua    # Inline references/implementations
│       ├── theme.lua           # Colorschemes (tokyonight, catppuccin, kanagawa)
│       ├── themetry.lua        # Theme switcher (Themery)
│       ├── telescope.lua       # Fuzzy finder
│       ├── neo-tree.lua        # File explorer
│       ├── treesitter.lua      # Syntax highlighting
│       ├── nvim-cmp.lua        # Autocompletion
│       ├── gitsigns.lua        # Git gutter signs
│       ├── lazy-git.lua        # LazyGit integration
│       ├── trouble.lua         # Diagnostics panel
│       ├── bufferline.lua      # Buffer tabs
│       ├── lualine.lua         # Status line
│       ├── noice.lua           # UI for messages/cmdline
│       ├── notify.lua          # Notification popups
│       ├── which-key.lua       # Keybinding hints
│       ├── neoscroll.lua       # Smooth scrolling
│       ├── neotest.lua         # Test runner (Go, Lua)
│       ├── grug-far.lua        # Find and replace
│       ├── undotree.lua        # Undo history
│       ├── bufdelete.lua       # Buffer delete without closing window
│       ├── utility.lua         # Devicons, Comment.nvim
│       ├── jsx.lua             # JSX syntax support
│       ├── leetcode.lua        # LeetCode integration
│       └── snake.lua           # Snake game
└── lazy-lock.json              # Plugin version lockfile
```

## Plugins

| Plugin                | Description                                   |
| --------------------- | --------------------------------------------- |
| **lazy.nvim**         | Plugin manager with lazy-loading              |
| **nvim-lspconfig**    | LSP server configuration                      |
| **mason.nvim**        | Auto-install LSP servers, formatters, linters |
| **conform.nvim**      | Code formatting (format on save)              |
| **nvim-jdtls**        | Java language server                          |
| **lsp-lens.nvim**     | Inline reference/implementation counts        |
| **nvim-cmp**          | Autocompletion engine                         |
| **LuaSnip**           | Snippet engine                                |
| **friendly-snippets** | VS Code-style snippet collection              |
| **telescope.nvim**    | Fuzzy finder for files, grep, buffers         |
| **neo-tree.nvim**     | File explorer sidebar                         |
| **nvim-treesitter**   | Syntax highlighting and text objects          |
| **gitsigns.nvim**     | Git signs in gutter, hunk staging             |
| **lazygit.nvim**      | LazyGit terminal integration                  |
| **trouble.nvim**      | Diagnostics and symbols panel                 |
| **bufferline.nvim**   | Buffer tabs                                   |
| **lualine.nvim**      | Status line                                   |
| **noice.nvim**        | Enhanced UI for messages and cmdline          |
| **nvim-notify**       | Notification popups                           |
| **which-key.nvim**    | Keybinding discovery (press leader and wait)  |
| **neoscroll.nvim**    | Smooth scrolling animations                   |
| **neotest**           | Test runner (Go via gotestsum)                |
| **grug-far.nvim**     | Project-wide find and replace                 |
| **undotree**          | Undo history visualizer                       |
| **bufdelete.nvim**    | Delete buffers without closing windows        |
| **Comment.nvim**      | Toggle comments                               |
| **vim-jsx-pretty**    | JSX syntax highlighting                       |
| **themery.nvim**      | Theme switcher with live preview              |
| **tokyonight.nvim**   | Tokyo Night colorscheme (transparent)         |
| **catppuccin**        | Catppuccin colorscheme                        |
| **kanagawa.nvim**     | Kanagawa colorscheme                          |
| **leetcode.nvim**     | LeetCode problem solving                      |
| **snake.nvim**        | Snake game                                    |

## Themes

Switch themes with `:Themery`. Available themes:

| Theme                | Style              |
| -------------------- | ------------------ |
| catppuccin-latte     | Light              |
| catppuccin-frappe    | Dark               |
| catppuccin-macchiato | Dark               |
| catppuccin-mocha     | Dark               |
| tokyonight           | Dark (transparent) |
| kanagawa-wave        | Dark               |
| kanagawa-dragon      | Dark               |
| kanagawa-lotus       | Light              |

## LSP Servers

Auto-installed via Mason:

| Server                              | Languages                                                                  |
| ----------------------------------- | -------------------------------------------------------------------------- |
| **vtsls**                           | TypeScript, JavaScript, JSX, TSX                                           |
| **gopls**                           | Go                                                                         |
| **lua_ls**                          | Lua                                                                        |
| **yamlls**                          | YAML (with schema support for K8s, Docker Compose, GitHub Actions, ArgoCD) |
| **bashls**                          | Bash                                                                       |
| **cssls**                           | CSS                                                                        |
| **html**                            | HTML                                                                       |
| **tailwindcss**                     | Tailwind CSS                                                               |
| **eslint**                          | JavaScript/TypeScript linting                                              |
| **dockerls**                        | Dockerfile                                                                 |
| **docker_compose_language_service** | Docker Compose                                                             |
| **helm_ls**                         | Helm charts                                                                |
| **intelephense**                    | PHP                                                                        |
| **jdtls**                           | Java (via nvim-jdtls)                                                      |

## Formatters

Auto-run on save via conform.nvim:

| Language      | Formatter          |
| ------------- | ------------------ |
| JS/TS/JSX/TSX | prettier           |
| CSS/SCSS      | prettier           |
| HTML          | prettier           |
| JSON          | prettier           |
| YAML          | prettier           |
| Markdown      | prettier           |
| Lua           | stylua             |
| Go            | goimports, gofumpt |
| Java          | google-java-format |

## Keybindings

Leader key: `Space`

### General

| Key           | Mode   | Action                  |
| ------------- | ------ | ----------------------- |
| `<leader>w`   | Normal | Save buffer             |
| `<leader>wa`  | Normal | Save all buffers        |
| `<leader>q`   | Normal | Close buffer            |
| `<leader>v`   | Normal | Vertical split          |
| `<leader>h`   | Normal | Horizontal split        |
| `<C-h/j/k/l>` | Normal | Navigate between splits |
| `<Tab>`       | Normal | Next buffer             |
| `<S-Tab>`     | Normal | Previous buffer         |
| `Q`           | Normal | Disabled                |
| `<C-f>`       | Normal | tmux sessionizer        |

### Editing

| Key         | Mode          | Action                              |
| ----------- | ------------- | ----------------------------------- |
| `J`         | Visual        | Move selection down                 |
| `K`         | Visual        | Move selection up                   |
| `<leader>p` | Visual        | Paste without overwriting clipboard |
| `<leader>y` | Normal/Visual | Yank to system clipboard            |
| `<leader>Y` | Normal        | Yank line to system clipboard       |
| `<leader>s` | Normal        | Replace word under cursor           |
| `gcc`       | Normal        | Toggle line comment                 |
| `gc`        | Visual        | Toggle comment on selection         |
| `gbc`       | Normal        | Toggle block comment                |

### Search & Navigation

| Key          | Mode   | Action                            |
| ------------ | ------ | --------------------------------- |
| `n`          | Normal | Next search result (centered)     |
| `N`          | Normal | Previous search result (centered) |
| `<C-p>`      | Normal | Git files (Telescope)             |
| `<leader>ff` | Normal | Find files                        |
| `<leader>fg` | Normal | Live grep                         |
| `<leader>fb` | Normal | Buffers                           |
| `<leader>fh` | Normal | Help tags                         |
| `<leader>ps` | Normal | Grep string (with prompt)         |
| `<leader>ft` | Normal | Toggle file explorer (Neo-tree)   |
| `<leader>fr` | Normal | Find and replace (grug-far)       |
| `<leader>u`  | Normal | Toggle undo tree                  |
| `<leader>?`  | Normal | Show buffer keymaps (which-key)   |

### LSP

| Key          | Mode          | Action                         |
| ------------ | ------------- | ------------------------------ |
| `gd`         | Normal        | Go to definition               |
| `gD`         | Normal        | Go to declaration              |
| `gi`         | Normal        | Go to implementation           |
| `gt`         | Normal        | Go to type definition          |
| `gR`         | Normal        | Show references                |
| `K`          | Normal        | Hover documentation            |
| `<leader>ca` | Normal/Visual | Code actions                   |
| `<leader>rn` | Normal        | Rename symbol                  |
| `<leader>d`  | Normal        | Line diagnostics               |
| `<leader>D`  | Normal        | Buffer diagnostics (Telescope) |
| `[d`         | Normal        | Previous diagnostic            |
| `]d`         | Normal        | Next diagnostic                |
| `<leader>ih` | Normal        | Toggle inlay hints             |
| `<leader>rs` | Normal        | Restart LSP                    |
| `<leader>F`  | Normal        | Format buffer                  |

### Git

| Key          | Mode            | Action              |
| ------------ | --------------- | ------------------- |
| `<leader>gg` | Normal          | Open LazyGit        |
| `<leader>gs` | Normal/Visual   | Stage hunk          |
| `<leader>gr` | Normal/Visual   | Reset hunk          |
| `<leader>gS` | Normal          | Stage buffer        |
| `<leader>gR` | Normal          | Reset buffer        |
| `<leader>gp` | Normal          | Preview hunk        |
| `<leader>gb` | Normal          | Blame line          |
| `<leader>gB` | Normal          | Toggle inline blame |
| `<leader>gd` | Normal          | Diff this           |
| `<leader>gD` | Normal          | Diff against ~      |
| `]c`         | Normal          | Next git hunk       |
| `[c`         | Normal          | Previous git hunk   |
| `ih`         | Operator/Visual | Select git hunk     |

### Diagnostics (Trouble)

| Key          | Mode   | Action                    |
| ------------ | ------ | ------------------------- |
| `<leader>xx` | Normal | Toggle diagnostics        |
| `<leader>xX` | Normal | Toggle buffer diagnostics |
| `<leader>cs` | Normal | Toggle symbols            |
| `<leader>xq` | Normal | Toggle quickfix list      |

### Testing (Go/Lua)

| Key          | Mode   | Action                   |
| ------------ | ------ | ------------------------ |
| `<leader>tr` | Normal | Run nearest test         |
| `<leader>tf` | Normal | Run all tests in file    |
| `<leader>ta` | Normal | Run all tests in project |
| `<leader>ts` | Normal | Toggle test summary      |
| `<leader>to` | Normal | Show test output         |
| `<leader>tq` | Normal | Stop running tests       |

### Treesitter

| Key           | Mode          | Action                 |
| ------------- | ------------- | ---------------------- |
| `<C-Space>`   | Normal/Visual | Start/expand selection |
| `<Backspace>` | Visual        | Shrink selection       |

### Completion (Insert Mode)

| Key         | Action              |
| ----------- | ------------------- |
| `<C-j>`     | Next suggestion     |
| `<C-k>`     | Previous suggestion |
| `<C-Space>` | Trigger completion  |
| `<C-e>`     | Close completion    |
| `<CR>`      | Confirm selection   |
| `<C-b>`     | Scroll docs up      |
| `<C-f>`     | Scroll docs down    |

## Editor Settings

- 4-space indentation (spaces, not tabs)
- Line numbers (absolute)
- No line wrapping
- Persistent undo (`~/.cache/nvim/undo`)
- System clipboard integration
- Incremental search (no persistent highlight)
- Smooth scrolling
- 8-line scroll offset
- Rounded window borders
- Sign column always visible
- 50ms update time
