return {
  "oil.nvim",
  lazy = false,
  after = function()
    require("oil").setup()
  end,
}
