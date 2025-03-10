return {
  "nvim-notify",
  after = function()
    vim.notify = require("notify")
    vim.keymap.set("n", "<leader>fn", ":Telescope notify<CR>", { desc = "Telescope find notify logs" })
  end,
}
