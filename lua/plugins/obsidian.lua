return {
  "obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",

  after = function()
    require("obisdian")()
  end,
}
