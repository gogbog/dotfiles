return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		require("mason-lspconfig").setup({
			automatic_enable = {
				exclude = { "jdtls", "stylua" },
			},
			ensure_installed = {
				"bashls",
				"cssls",
				"docker_compose_language_service",
				"dockerls",
				"eslint",
				"gopls",
				"helm_ls",
				"html",
				"intelephense",
				"jdtls",
				"lua_ls",
				"tailwindcss",
				"vtsls",
				"yamlls",
			},
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				"gofumpt",
				"goimports",
				"gomodifytags",
				"google-java-format",
				"impl",
				"prettier",
				"stylua",
			},
		})
	end,
}
