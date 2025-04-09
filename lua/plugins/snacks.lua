return {
  "snacks.nvim",
  lazy = false,
  priority = 1000,
  after = function()
    require("snacks").setup({
      animate = { enabled = true },
      scroll = { enabled = true },
      indent = {
        enabled = true, -- enable indent guides
        only_scope = true,
        only_current = true,
      },
      scope = { enabled = true },
      lazygit = { enabled = true },
      statuscolumn = { enabled = true },
    })
    --Keybinds for snacks
    vim.keymap.set("n", "<leader>lg", function()
      Snacks.lazygit.open()
    end, { desc = "Opens LazyGit" })
  end,
}
