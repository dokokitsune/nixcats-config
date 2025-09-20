return {
  {
    "markdown.nvim",
    after = function()
      require("markdown").setup({})
    end,

    on_attach = function(bufnr)
      local function toggle(key)
        return "<Esc>gv<Cmd>lua require'markdown.inline'" .. ".toggle_emphasis_visual'" .. key .. "'<CR>"
      end

      vim.keymap.set("x", "<C-b>", toggle("b"), { buffer = bufnr })
      vim.keymap.set("x", "<C-i>", toggle("i"), { buffer = bufnr })
    end,
  },
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
    "render-markdown.nvim",
    after = function()
      require("render-markdown").setup({})
    end,
  },
}
