return {

  "neo-tree.nvim",
  keys = {
    -- Create a key mapping and lazy-load when it is used
    { "<leader>n", "<CMD>Neotree toggle<CR>", desc = "NeoTree toggle" },
  },
  after = function()
    require("neo-tree").setup()
  end,
}
