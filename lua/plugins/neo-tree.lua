return {

  "neo-tree.nvim",
  dep_of = { "plenary.nvim", "nui.nvim" },
  event = "DeferredUIEnter",
  after = function()
    vim.keymap.set("n", "<leader>n", "<CMD>Neotree filesystem reveal left<CR>", { desc = "Neotree Open Left Side" })
  end,
}
