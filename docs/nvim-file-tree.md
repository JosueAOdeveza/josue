# Neovim file tree

[nvim-tree](../nvim/lua/plugins/nvim-tree.lua) provides a VS Code–style explorer
on the left. It replaces netrw, so `nvim .` opens the tree too.

- `<leader>e` toggles the tree; `<leader>E` reveals the current file.
- Inside the tree, `g?` lists its mappings (`a` create, `r` rename, `d` delete,
  `<CR>` open, `H` toggle dotfiles).
- Dotfiles and gitignored files are shown; only `.git` is hidden.
- Icons need a Nerd Font in the terminal (Ghostty uses FiraCode Nerd Font).
- Mouse is enabled (`vim.opt.mouse = "a"`): click to open files and folders.
- auto-session closes the tree before saving, so restored sessions do not keep
  an empty tree buffer.
