return {
  "rmagatti/auto-session",
  lazy = false,
  config = function()
    require("auto-session").setup({
      git_use_branch_name = true,
      suppressed_dirs = { "~/", "/", "~/Downloads" },
      -- Sessions restore the file tree window as an empty buffer.
      pre_save_cmds = { "NvimTreeClose" },
      session_lens = {
        picker = "telescope",
      },
    })
  end,
}
