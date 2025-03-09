return {
  "blink.cmp",
  version = "*",
  opts = {
    keymap = { preset = 'default' },
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
    },

    snippets = { preset = "luasnip" },
    opts_extend = { "sources.default" }
  },

}
