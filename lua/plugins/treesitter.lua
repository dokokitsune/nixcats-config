return {
  "nvim-treesitter",
  event = "DeferredUIEnter",
  after = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      highlight = true,
      indent = true,
    })
  end

}
