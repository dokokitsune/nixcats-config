return {
  "neo-tree.nvim",
  keys = {
    { "<leader>n", "<CMD>Neotree toggle", desc = "NeoTree toggle" },
  },
  after = function()
    require("neo-tree").setup()
  end,
}
