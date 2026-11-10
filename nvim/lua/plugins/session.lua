return {
  "rmagatti/auto-session",
  lazy = false,
  config = function()
    require("auto-session").setup({
      git_use_branch_name = true,
      suppressed_dirs = { "~/", "/", "~/Downloads" },
      -- Sessions restore the file tree window as an empty buffer.
      pre_save_cmds = { "NvimTreeClose" },
      -- Open the file tree on startup, with or without a saved session.
      post_restore_cmds = { "NvimTreeOpen" },
      no_restore_cmds = { "NvimTreeOpen" },
      session_lens = {
        picker = "telescope",
      },
    })
  end,
}
