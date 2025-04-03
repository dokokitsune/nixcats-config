return {
  --URL View
  {
    "urlview.nvim",
    after = function()
      require("urlview").setup({
        -- custom configuration options --
        vim.keymap.set("n", "<leader>u", "<Cmd>UrlView<CR>", { desc = "View buffer URLs" })
      })
    end,
  },
}
