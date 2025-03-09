return {
  "nvim-treesitter",
  build = ":TSUpdate",
  event = "DeferredUIEnter",
  after = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {
        "lua",
        "javascript",
        "cpp",
        "css",
        "html",
        "nix",
        "scss",
        "typescript",
        "yaml",
        "json",
        "toml",
        "python",
        "fish",
        "bash",
        "c",
        "dockerfile",
        "tsx",
        "gitignore",
        "terraform",
        "hcl",
      },
      highlight = true,
      sync_install = false,
      indent = true,
    })
  end

}
