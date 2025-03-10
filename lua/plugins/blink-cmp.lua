return {
  {
    "luasnip",
    dep_of = { "blink.cmp" },
  },

  {
    "blink.cmp",
    version = "*",
    dep_of = { "nvim-lspconfig" },
    after = function()
      require("blink.cmp").setup({
        keymap = {
          preset = 'default',

          ['C-k'] = { 'select_prev', 'fallback' },
          ['<C-j>'] = { 'select_next', 'fallback' },
          ['<CR>'] = { 'select_and_accept', 'fallback' },
          ['<leader>k'] = { 'show_documentation', 'fallback' },
        },
        appearance = {

          use_nvim_cmp_as_default = true,
          nerd_font_variant = 'mono',
        },
        sources = {
          default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
        completion = {
          keyword = { range = "prefix" },
          list = { selection = { preselect = true, auto_insert = true } },
          ghost_text = { enabled = true },
          window = { border = "rounded" },
        },
        documentation = {
          enabled = true
        },

        snippets = { preset = "luasnip" },


      })
    end,
  }


}
