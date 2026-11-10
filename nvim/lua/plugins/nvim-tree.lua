return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  init = function()
    -- nvim-tree replaces netrw; disable it before netrw's plugin file loads.
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
  config = function()
    require("nvim-tree").setup({
      view = {
        side = "left",
        width = 35,
      },
      renderer = {
        group_empty = true,
      },
      -- Highlight the current buffer's file in the tree, like VS Code.
      update_focused_file = {
        enable = true,
      },
      filters = {
        dotfiles = false,
        custom = { "^\\.git$" },
      },
      git = {
        ignore = false,
      },
    })
  end,
}
