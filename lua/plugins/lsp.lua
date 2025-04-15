local servers = {}

servers.lua_ls = {
  Lua = {
    runtime = {
      -- Tell the language server which version of Lua you're using
      -- (most likely LuaJIT in the case of Neovim)
      version = "LuaJIT",
    },
    formatters = {
      ignoreComments = false,
    },
    signatureHelp = { enabled = true },
    diagnostics = {
      disable = { "missing-fields" },
      -- Get the language server to recognize the `vim` global
      globals = {
        "vim",
        "require",
      },
    },
    workspace = {
      -- Make the server aware of Neovim runtime files
      library = vim.api.nvim_get_runtime_file("", true),
    },
  },
  telemetry = { enabled = false },
  filetypes = { "lua" },
}

servers.bashls = {}

servers.nixd = {}

servers.nil_ls = {}

servers.terraformls = {}
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
servers.helmls = {}
servers.yamlls = {
  settings = {
    yaml = {
      schemas = {
        -- Kubernetes schemas - more specific patterns
        ["https://raw.githubusercontent.com/kubernetes/kubernetes/master/api/openapi-spec/swagger.json"] = {
          "k8s/**/*.yaml",
          "kubernetes/**/*.yaml",
          "*deployment.yaml",
          "*service.yaml",
          "*ingress.yaml",
          "*configmap.yaml",
          "*pod.yaml",
          "*statefulset.yaml"
        },
        -- Keep all your existing schemas
        ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
        ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
        ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
        ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
        ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
        ["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
        ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
        ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
        ["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
        ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] =
        "*api*.{yml,yaml}",
        ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] =
        "*docker-compose*.{yml,yaml}",
        ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] =
        "*flow*.{yml,yaml}",
      },
      schemaDownload = { enable = true },
      validate = true,
      hover = true,
      completion = true,
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
      for server_name, config in pairs(servers) do
        require("lspconfig")[server_name].setup({
          capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities),
          settings = config,
          filetypes = (config or {}).filetypes,
          cmd = (config or {}).cmd,
          root_pattern = (config or {}).root_pattern,
        })
      end
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Code" })
    end,
  },
}
