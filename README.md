# Neovim Configuration

This is an updated version of the Neovim Configuration that I created, which used Packer for Package management.

I disliked the performance of Packer, so I switched to using Lazy.nvim for package management.

I also disliked manually installing all of my language servers, formatters, and linters globally on my system, so I switched to using Mason.nvim to manage those tools on a per-user basis, via UI.

Feel free to fork and modify this configuration to suit your needs. I will not be accepting pull requests, as this is a personal configuration.

Why didn't I use a distro? I like to have full control over my configuration and the plugins I use. LazyVim who?

## Keybindings Cheat Sheet

### General
All of these key bindings are in normal mode unless otherwise specified.
- `CTRL + X`: Close the current buffer without closing the window.
- `;to`: Open a terminal
- `;tc`: Close the terminal at the bottom of the window (Does not close all terminal buffers)
- `;ww`: Tired of seeing `:W is not a command`? I was too. Use this to quicksave.
- `;tt`: Open a new tab

### Symbols Outline
- `;so`: Toggle Symbols Outline
- `;soo`: Open Symbols Outline
- `;soc`: Close Symbols Outline
- `<Esc>`: Close Symbols Outline (When focused on Symbols Outline window)
- `<Enter>`: Go to symbol (When focused on Symbols Outline window)
- `o`: Focus location (When focused on Symbols Outline window)
- `CTRL + SPACE`: Hover Symbol (When focused on Symbols Outline window)
- `K`: Toggle preview (When focused on Symbols Outline window)
- `r`: Rename symbol (When focused on Symbols Outline window)
- `a`: Code actions (When focused on Symbols Outline window)
- `h`: Fold symbol (When focused on Symbols Outline window)
- `l`: Unfold symbol (When focused on Symbols Outline window)
- `W`: Fold all symbols (When focused on Symbols Outline window)
- `E`: Unfold all symbols (When focused on Symbols Outline window)
- `R`: Reset folds (When focused on Symbols Outline window)

### LSP
All of these key bindings are in normal mode unless otherwise specified.
- `;e`: Open floating diagnostic window
- `;qf`: Set quickfix list
- `;gD`: Go to declaration
- `;gd`: Go to definition
- `;K`: Hover to see documentation
- `gi`: Go to implementation
- `CTRL + k`: Show signature help
- `<space>wa`: Add workspace folder
- `<space>wr`: Remove workspace folder
- `<space>wl`: List workspace folders
- `<space>D`: Type definition
- `<space>rn`: Rename symbol
- `<space>ca`: Code action
- `gr`: Get references
- `<space>f`: Format document
- `<space>q`: Set Diagnostics in location list
- `[d`: Get Previous diagnostic
- `]d`: Get Next diagnostic

### Debugger
All of these key bindings are in normal mode unless otherwise specified.
- `;b`: Toggle DAP breakpoint
- `;gb`: Run debugger to cursor (DAP)
- `;?`: Eval Under Cursor (DAP)
- `<F1>`: (With Active Debugging Session) Continue
- `<F2>`: (With Active Debugging Session) Step Into
- `<F3>`: (With Active Debugging Session) Step Over
- `<F4>`: (With Active Debugging Session) Step Out 
- `<F5>`: (With Active Debugging Session) Step Out 
- `<F13>`: (With Active Debugging Session) Restart 

### Dev Container
All of these key bindings are in normal mode unless otherwise specified.
- `;dcs`: Start Dev Container
- `;dcr`: Rebuild Dev Container
- `;dcf`: Enter Fullscreen Dev Container
- `;dcff`: Exit Fullscreen Dev Container

### Git
All of these key bindings are in normal mode unless otherwise specified.
- `]c`: Next Hunk
- `[c`: Previous Hunk
- `;hs`: Stage Hunk
- `;hr`: Reset Hunk
- `;hS`: Stage Buffer
- `;hu`: Undo Stage Hunk
- `;hR`: Reset Buffer
- `;hp`: Preview Hunk
- `;hb`: Blame Line
- `;tb`: Toggle Current Blame Line
- `;hd`: Diff Current File
- `;ted`: Toggle Deleted Lines

### AI
All of these key bindings are in normal mode unless otherwise specified.
- `;oa`: Open an ask interaction with OpenCode
- `;ox`: Open a select interaction with OpenCode
- `;oc`: Toggle OpenCode Buffer
- `;ogo`: Add range to OpenCode context
- `;ogoo`: Add line to OpenCode context

## Autoutils

### Autoload 

Provided by `/lua/config/autoutil/autoload.lua`, automatically reloads the active buffer if the file has been changed outside of Neovim.

### Autosave

Provided by `/lua/config/autoutil/autosave.lua`, automatically saves the active buffer when switching to another buffer.

Does not work when the window loses focus (e.g., switching to another application), only when switching buffers within Neovim.

> `;ww` is your friend.

## Plugins

### AI

[**Copilot.lua**](https://github.com/zbirenbaum/copilot.lua)
*Depends On:* [copilot-lsp](https://github.com/copilotlsp-nvim/copilot-lsp)

Provides inline AI code suggestions using GitHub Copilot.

Currently enabled for the following filetypes:
- C++
- C#
- Dockerfile
- Go
- Lua
- Markdown
- Javascript
- Python
- Shell (Disabled for .env files)
- Terraform
- Typescript

> You need to run :Copilot auth and :Copilot setup after installing the plugin to use GitHub Copilot.

[**OpenCode.nvim**](https://github.com/NickvanDyke/opencode.nvim)

*Depends On:* [snacks.nvim](https://github.com/folke/snacks.nvim)

Provides integration with OpenCode for agent-based AI coding assistance.

Supports raw sessions, as well as ask and select interactions.

### LSP

[**Blink.cmp**](https://github.com/saghen/blink.cmp)

*Depends On:*
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)
- [blink-cmp-copilot](https://github.com/giuxtaposition/blink-cmp-copilot)

Combines multiple completion sources, including AI-based suggestions from GitHub Copilot, to provide a comprehensive code completion experience.

Integrates with neovim-lspconfig.

[**Debugger Adapter Protocol (DAP)**](https://github.com/mfussenegger/nvim-dap)

*Depends On:*
- [cmake-tools.nvim](https://github.com/Civitasv/cmake-tools.nvim)
- [nvim-dap-go](https://github.com/leoluz/nvim-dap-go)
- [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
- [nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text)
- [nvim-nio](https://github.com/nvim-neotest/nvim-nio)
- [mason.nvim](https://github.com/williamboman/mason.nvim)

Provides debugging capabilities for Neovim, with support for multiple programming languages and integration with Mason.nvim for managing debug adapters.

Current config only supports C, C++, and Go, but adding more languages is straightforward.

Install your debugger of choice using Mason.nvim, configure it in `/lua/config/plugins/lsp/dap.lua`. If there is a plugin to extend the DAP for your language, install and configure that as well. Some plugins do the DAP configuration for you (e.g., nvim-dap-go).

[**LSP Config**](https://github.com/neovim/nvim-lspconfig)

*Depends On:*
- [blink.cmp](https://github.com/saghen/blink.cmp)
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
- [vim-helm](https://github.com/towolf/vim-helm)
- [templ.vim](https://github.com/joerdav/templ.vim)

Provides Language Server Protocol (LSP) support for Neovim, enabling features like code completion, diagnostics, and code navigation.

Install your language servers using Mason.nvim, then configure them in `/lua/config/plugins/lsp/lsp-config.lua`.

[**LuaSnip**](https://github.com/L3MON4D3/LuaSnip)

*Depends On:*
- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)

Provides snippet support for Neovim, allowing you to insert predefined code snippets quickly.

[**Mason.nvim**](https://github.com/williamboman/mason.nvim)

*Depends On:*
- [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
- [mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim)

Provides a package manager for Neovim, allowing you to easily install and manage LSP servers, DAP servers, linters, and formatters.

### UI

[**Bufferline.nvim**](https://github.com/akinsho/bufferline.nvim)

Better looking tabline for Neovim, with support for icons and custom styling.

[**vim-css-color**](https://github.com/ap/vim-css-color)

Provides color previewing for CSS color codes directly in the editor.

Sometimes doesn't work...

[**nvim-web-devicons**](https://github.com/nvim-tree/nvim-web-devicons)

Provides icons for various file types and plugins in Neovim.

[**Harpoon 2**](https://github.com/ThePrimeagen/harpoon)

Provides quick file navigation and bookmarking capabilities within Neovim. (One of my favorites...)

[**lualine.nvim**](https://github.com/nvim-lualine/lualine.nvim)

Provides a customizable status line for Neovim, displaying useful information such as file name, line number, and git branch.

[**plenary.nvim**](https://github.com/nvim-lua/plenary.nvim)

Provides a set of Lua functions and utilities for Neovim plugin development.

Required by a bunch of UI plugins.

[**popup.nvim**](https://github.com/nvim-lua/popup.nvim)

Provides a popup API for Neovim, allowing plugins to create floating windows and menus.

Required by a bunch of UI plugins.

[**symbols-outline.nvim**](https://github.com/simrat39/symbols-outline.nvim)

Provides outline of language symbols for easy navigation and code understanding.

[**telescope.nvim**](https://github.com/nvim-telescope/telescope.nvim)

*Depends On:*
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- [telescope-live-grep-args](https://github.com/nvim-telescope/telescope-live-grep-args.nvim)
- [telescope-file-browser.nvim](https://github.com/nvim-telescope/telescope-file-browser.nvim)
- [telescope-ui-select.nvim](https://github.com/nvim-telescope/telescope-ui-select.nvim)
- [telescope-zoxide](https://github.com/jvgrootveld/telescope-zoxide)

*System Dependencies (IMPORTANT):*

You *must* install the following system packages for integrations with RipGrep and Zoxide to work:

- [fzf](https://github.com/junegunn/fzf)
- [RipGrep](https://github.com/BurntSushi/ripgrep)
- [Zoxide](https://github.com/ajeetdsouza/zoxide)


Provides a highly extendable fuzzy finder for Neovim, allowing you to quickly search and open files, buffers, and more.

Made "smarter" by integrating live grep with arguments, a file browser, a UI selector, and Zoxide support.

[**tokyonight.nvim**](https://github.com/folke/tokyonight.nvim)

Provides a theme for Neovim with a dark color scheme and various customization options.

[**nvim-tree.lua**](https://github.com/nvim-tree/nvim-tree.lua)

Provides a file explorer tree for Neovim, allowing you to navigate and manage files and directories easily.

Use alongside Harpoon and Telescope for maximum productivity.

### Util

[**nvim-autopairs**](https://github.com/windwp/nvim-autopairs)

Automatically inserts matching pairs of brackets, quotes, and other characters as you type.

[**vim-commentary**](https://github.com/tpope/vim-commentary)

Provides easy commenting and uncommenting of code blocks in Neovim.

[**conform.nvim**](https://github.com/stevearc/conform.nvim)

Provides automatic code formatting for Neovim, supporting multiple formatters and languages.

Install your formatters using Mason.nvim, then configure them in `/lua/config/plugins/util/conform.lua`.

[**nvim-dev-container**](https://github.com/esensar/nvim-dev-container)

Provides VSCode-like integration with development containers, allowing you to work within containerized environments seamlessly.

[**fzf-lua**](https://github.com/ibhagwan/fzf-lua)

Provides fuzzy finding capabilities using FZF for Neovim, allowing you to quickly search and open files, buffers, and more.

[**gitsigns.nvim**](https://github.com/lewis6991/gitsigns.nvim)

Provides git integration for Neovim, displaying git changes and providing git-related commands.

[**vim-visual-multi**](https://github.com/mg979/vim-visual-multi)

Provides multiple cursor support for Neovim, allowing you to edit multiple lines or occurrences of text simultaneously.

[**vim-surround**](https://github.com/tpope/vim-surround)

Surround highlighted text with quotes, brackets, or other characters easily.

[**tree-sitter.nvim**](https://github.com/nvim-treesitter/nvim-treesitter)

Provides advanced syntax highlighting and code parsing for Neovim using Tree-sitter.

[**nvim-ts-autotag**](https://github.com/windwp/nvim-ts-autotag)

Provides automatic closing and renaming of HTML and XML tags using Tree-sitter.

