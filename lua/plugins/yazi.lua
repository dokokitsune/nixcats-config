return {
  "yazi.nvim",
  lazy = true,
  keys = {
    {
      "<leader>y",
      mode = { "n", "v" },
      "<CMD>Yazi<CR>",
      desc = "[Y]azi opens current file",
    },
    {
      "<leader>cw",
      mode = { "n", "v" },
      "<CMD>Yazi cwd<CR>",
      desc = "Open file manager in working dir",
    },
  },
  after = function()
    require("yazi").setup({
      open_for_directories = false,
      keymaps = {
        show_help = "<f1>",
      },
    })
  end,
}
