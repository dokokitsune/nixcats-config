return {
  {
    "nvim-web-devicons",
    after = function()
      require("nvim-web-devicons").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
      })
    end,
  },
  {
    "telescope.nvim",
    dep_of = { "plenary.nvim", "nvim-web-devicons" },
    event = "DeferredUIEnter",
    after = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
      require("plugins.telescope-ui")
    end,
  },
}
