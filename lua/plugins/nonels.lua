return {
  "none-ls.nvim",
  event = "DeferredUIEnter",
  after = function()
    local nonels = require("null-ls")
    nonels.setup({
      sources = {
        --Grammar
        nonels.builtins.diagnostics.codespell,

        --Markdown
        nonels.builtins.formatting.markdownlint,

        --Lua
        nonels.builtins.formatting.stylua,

        --Python
        nonels.builtins.formatting.isort,
        nonels.builtins.diagnostics.mypy,

        --TS/JS
        nonels.builtins.formatting.prettierd,
        --  require("none-ls.diagnostics.eslint_d"),


        --Yaml
        nonels.builtins.diagnostics.yamllint,

        --Nix
        nonels.builtins.diagnostics.deadnix,
        nonels.builtins.formatting.nixfmt,
        nonels.builtins.code_actions.statix,


        --terraform
        nonels.builtins.formatting.terraform_fmt,
        nonels.builtins.diagnostics.terraform_validate,

        --SQL
        nonels.builtins.diagnostics.sqruff,
      }
    })
    vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, { desc = '[F]or[M]at' })
  end
}
