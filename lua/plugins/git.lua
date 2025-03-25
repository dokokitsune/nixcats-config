return {
  {
    "git-blame.nvim",
    after = function()
      require("gitblame").setup()
    end,
  },
}
