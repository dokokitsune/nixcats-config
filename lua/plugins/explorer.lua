return {
  {
    "triptych.nvim",
    after = function()
      require("triptych").setup()
      vim.keymap.set("n", "<leader>y", ":Triptych<CR>", { silent = true, desc = "Toggle Triptych" })
    end,
  },
}
