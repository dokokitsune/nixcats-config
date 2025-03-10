return {

  "neo-tree.nvim",
  dep_of = { "nui.nvim" },
  event = "DeferredUIEnter",
  after = function()
    vim.keymap.set("n", "<leader>n", ":Neotree filesystem reveal left<CR>", { desc = "Neotree Open Left Side" })
  end,
}
