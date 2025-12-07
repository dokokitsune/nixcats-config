local servers = {}

vim.cmd.packadd("SchemaStore.nvim")

servers.lua_ls = {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      formatters = {
        ignoreComments = false,
      },
      signatureHelp = { enabled = true },
      diagnostics = {
        disable = { "missing-fields" },
        globals = {
          "vim",
          "require",
        },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
    },
    telemetry = { enabled = false },
    filetypes = { "lua" },
  },
}
servers.bashls = {}

servers.nixd = {}

servers.nil_ls = {}

servers.tofu_ls = {}

servers.dockerls = {
  settings = {
    docker = {
      languageserver = {
        formatter = {
          ignoreMultilineInstructions = true,
        },
      },
    },
  },
}

servers.pyrefly = {}
servers.ts_ls = {}
servers.tflint = {}
servers.taplo = {}
-- servers.marksman = {}
servers.ltex_plus = {
  settings = {
    ltex = {
      language = "en-US",
    },
  },
}
servers.yamlls = {
  settings = {
    redhat = {
      telemetry = {
        enabled = false,
      },
    },
    yaml = {
      format = {
        enable = false,
      },
      validate = true,
      hover = true,
      completion = true,
      schemaStore = {
        enable = false,
        url = "",
      },
      schemas = require("schemastore").yaml.schemas(),
    },
  },
}

servers.jsonls = {
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = true,
    },
  },
}

servers.cssls = {}

return {
  {
    "nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "LspInfo", "LspInstall", "LspUninstall" },
    after = function()
      -- Fixes terraform/tofu semanticTokenProvider bug causing Neovim to lockup.
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client.server_capabilities then
            client.server_capabilities.semanticTokensProvider = nil
          end
        end,
      })

      textDocument = {
        foldingRange = {
          dynamicRegistration = false,
          lineFoldingOnly = true,
        },
      }
      capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)
      for server, config in pairs(servers) do
        config.capabilities = vim.tbl_deep_extend("force", {}, capabilities, config.capabilities or {})
        vim.lsp.config(server, config)
        vim.lsp.enable(server)
      end
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Code" })
    end,
  },
}
