return {
  {
    "telescope-ui-select.nvim",
    event = "DeferredUIEnter",
    after = function()
      require("plugins.telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({
              -- even more opts
            }),
          },
        },
      })
      -- To get ui-select loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require("plugins.telescope").load_extension("ui-select")
    end,
  },

}
