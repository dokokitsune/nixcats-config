return {
  "nvim-colorizer.lua",
  event = "BufReadPre",
  after = function()
    require("colorizer").setup()
  end,
}
