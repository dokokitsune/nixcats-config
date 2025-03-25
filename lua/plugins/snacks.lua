return {
  "snacks.nvim",
  lazy = false,
  after = function()
    require("snacks").setup({


      scroll = { enabled = true },
      indent = {
        enabled = true, -- enable indent guides
        only_scope = true,
        only_current = true,
      },
      scope = { enabled = true },
      lazygit = { enabled = true },

    })
    --Keybinds for snacks
    vim.keymap.set("n", "<leader>lg", function()
      Snacks.lazygit.open()
    end, { desc = "Opens LazyGit" })
  end


}
