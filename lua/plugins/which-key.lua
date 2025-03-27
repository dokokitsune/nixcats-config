return {
  "which-key.nvim",
  lazy = true,
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
  after = function()
    require("which-key").setup()
  end,
}
