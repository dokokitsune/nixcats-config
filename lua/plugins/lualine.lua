return {
  "lualine.nvim",
  event = "DeferredUIEnter",
  deps_of = { "nvim-web-devicons" },
  after = function()
    require('lualine').setup()
  end,
}
