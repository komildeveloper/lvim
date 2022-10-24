-- Set a formatter.
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "prettier", filetypes = { "yaml", "yaml.docker-compose" } },
})

-- Set a linter.
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{ command = "yamllint", filetypes = { "yaml", "yaml.docker-compose" } },
})

-- Setup lsp.
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "yamlls" })

local opts = {
	settings = {
		yaml = {
			format = {
				enable = true,
			},
			validate = true,
      completion = true,
      hover = true,
			schemas = {
				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
				["https://raw.githubusercontent.com/GoogleContainerTools/skaffold/master/docs/content/en/schemas/v2beta8.json"] = "skaffold.yaml",
				["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose.yml",
				["https://json.schemastore.org/pre-commit-config.json"] = ".pre-commit-config.yaml",
				kubernetes = {
          "daemon.{yml,yaml}",
          "manager.{yml,yaml}",
          "*od*.{yml,yaml}",
          "*ort*.{yml,yaml}",
          "restapi.{yml,yaml}",
          "role.{yml,yaml}",
          "role_binding.{yml,yaml}",
          "*onfigma*.{yml,yaml}",
          "*ngres*.{yml,yaml}",
          "*ecre*.{yml,yaml}",
          "*eployment*.{yml,yaml}",
          "*ervic*.{yml,yaml}",
          "kubectl-edit*.yaml",
        },
			},
			schemaDownload = { enable = true, url = "https://www.schemastore.org/api/json/catalog.json" },
		},
	},
}
require("lvim.lsp.manager").setup("yamlls", opts)
