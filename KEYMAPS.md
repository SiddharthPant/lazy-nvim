# Neovim Keymaps Cheat Sheet

This matches the current LazyVim setup in this config.

## Code Browsing

- `K` - Hover docs for symbol under cursor
- `gK` - Signature help
- `gd` - Go to definition
- `gr` - References
- `gI` - Go to implementation
- `gy` - Go to type definition
- `gD` - Go to declaration
- `<leader>ca` - Code action

## Diagnostics

- `<leader>cd` - Show line diagnostics in a float
- `]d` - Next diagnostic
- `[d` - Previous diagnostic
- `]e` - Next error
- `[e` - Previous error
- `]w` - Next warning
- `[w` - Previous warning

## Completion

Current setup uses `blink.cmp`.

- `<C-space>` - Show completion and docs
- `<CR>` - Accept selected item
- `<C-y>` - Select and accept current or first item
- `<C-n>` - Next completion item
- `<C-p>` - Previous completion item
- `<Down>` - Next completion item
- `<Up>` - Previous completion item
- `<C-b>` - Scroll documentation up
- `<C-f>` - Scroll documentation down
- `<Tab>` - Snippet forward
- `<S-Tab>` - Snippet backward
- `<C-k>` - Signature help in completion

## Buffers

- `<S-h>` - Previous buffer
- `<S-l>` - Next buffer
- `[b` - Previous buffer
- `]b` - Next buffer
- `<leader>bb` - Switch to other buffer
- `<leader>\`` - Switch to other buffer
- `<leader>bd` - Delete buffer
- `<leader>bo` - Delete other buffers
- `<leader>bD` - Delete buffer and window

## Windows

- `<C-h>` / `<C-j>` / `<C-k>` / `<C-l>` - Move between windows
- `<leader>-` - Split window below
- `<leader>|` - Split window right
- `<leader>wd` - Delete window
- `<C-Up>` / `<C-Down>` - Resize height
- `<C-Left>` / `<C-Right>` - Resize width

## Files And Search

- `<C-s>` - Save file
- `<leader>fn` - New file
- `<leader>l` - Lazy
- `<leader>ff` - Find files
- `<leader>fg` - Live grep
- `<leader>fr` - Recent files
- `<leader>sf` - Search files

## Tabs

- `<leader><tab><tab>` - New tab
- `<leader><tab>]` - Next tab
- `<leader><tab>[` - Previous tab
- `<leader><tab>l` - Last tab
- `<leader><tab>f` - First tab
- `<leader><tab>o` - Close other tabs
- `<leader><tab>d` - Close tab

## Useful Toggles

- `<leader>ul` - Toggle line numbers
- `<leader>uL` - Toggle relative numbers
- `<leader>ud` - Toggle diagnostics
- `<leader>uf` - Toggle autoformat
- `<leader>uF` - Force format toggle
- `<leader>uh` - Toggle inlay hints

