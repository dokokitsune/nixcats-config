return {
  "neo-tree.nvim",
  after = function()
    require("neo-tree").setup()
    vim.keymap.set("n", "<leader>ee", "<Cmd>Neotree toggle<CR>", { desc = "Toggle Neotree" })
    vim.keymap.set(
      "n",
      "<leader>ef",
      "<Cmd>Neotree filesystem reveal left<CR>",
      { desc = "Toggle Neotree on current location" }
    )
  end,
}
