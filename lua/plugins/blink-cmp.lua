return {
  {
    "luasnip",
    dep_of = { "blink.cmp" },
  },

  {
    "blink.cmp",
    version = "1.*",
    dep_of = { "nvim-lspconfig" },
    after = function()
      require("blink.cmp").setup({
        keymap = {
          preset = "default",

          ["<C-k>"] = { "select_prev", "fallback" },
          ["<C-j>"] = { "select_next", "fallback" },
          ["<CR>"] = { "select_and_accept", "fallback" },
        },
        appearance = {

          use_nvim_cmp_as_default = true,
          nerd_font_variant = "mono",
        },
        sources = {
          default = { "lsp", "path", "snippets", "buffer" },
        },

        completion = {
          keyword = { range = "prefix" },
          menu = {
            draw = { columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } } },
          },
          list = { selection = { preselect = true, auto_insert = true } },
        },
        snippets = { preset = "luasnip" },

        signature = { enabled = true },
      })
    end,
  },
}
