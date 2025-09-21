local servers = {}

servers.lua_ls = {
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
				enable = true,
				url = "https://www.schemastore.org/json",
			},
		},
	},
}

servers.cssls = {}
return {
	{
		"nvim-lspconfig",
		event = { "BufReadPost", "BufNewFile" },
		dep_of = { "nvim-lspconfig" },
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
