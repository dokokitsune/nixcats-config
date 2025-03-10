return {
  "snacks.nvim",
  lazy = false,
  after = function()
    require("snacks").setup({
      explorer = { enabled = true },

      scroll = { enabled = true },
      indent = {
        enabled = true, -- enable indent guides
        only_scope = true,
        only_current = true,
      },
      scope = { enabled = true },
    })
    --Keybinds for Snacks
    vim.keymap.set("n", "<leader>n", function()
      Snacks.explorer.open()
    end, { desc = "Explorer" })
  end


}
