return {
  {
    "obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",

    after = function()
      require("obsidian").setup({
        workspaces = {
          {
            name = "nix",
            path = "~/vaults/nix",
          },
        },
      })
    end,
  },
  {
    "markview.nvim",
    lazy = false,
  }
}
