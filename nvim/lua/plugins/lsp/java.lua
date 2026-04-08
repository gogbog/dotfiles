return {
	"mfussenegger/nvim-jdtls",
	ft = "java",
	dependencies = {
		"williamboman/mason.nvim",
	},
	config = function()
		local sep = package.config:sub(1, 1)
		local data_dir = vim.fn.stdpath("data")
		local jdtls_path = data_dir .. "/mason/packages/jdtls"

		local function get_jdtls_config()
			local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
			local workspace_dir = data_dir .. sep .. "jdtls-workspace" .. sep .. project_name
			local os_name = vim.uv.os_uname().sysname
			local launcher = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
			local config_dir = os_name == "Darwin" and "config_mac"
				or os_name == "Linux" and "config_linux"
				or "config_win"

			return {
				cmd = {
					vim.fn.expand("~/.sdkman/candidates/java/current/bin/java"),
					"-Declipse.application=org.eclipse.jdt.ls.core.id1",
					"-Dosgi.bundles.defaultStartLevel=4",
					"-Declipse.product=org.eclipse.jdt.ls.core.product",
					"-Dlog.level=ERROR",
					"-javaagent:" .. data_dir .. sep .. "mason" .. sep .. "packages" .. sep .. "jdtls" .. sep .. "lombok.jar",
					"-Xmx1g",
					"--add-opens",
					"java.base/java.util=ALL-UNNAMED",
					"--add-opens",
					"java.base/java.lang=ALL-UNNAMED",
					"-jar",
					launcher,
					"-configuration",
					jdtls_path .. "/" .. config_dir,
					"-data",
					workspace_dir,
				},
				root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
				settings = {
					java = {
						format = {
							enabled = true,
							comments = true,
							settings = {
								url = vim.fn.stdpath("config") .. "/utils/eclipse-java-google-style.xml",
								profile = "GoogleStyle",
							},
						},
					},
				},
				init_options = {
					bundles = {},
				},
			}
		end

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "java",
			callback = function()
				require("jdtls").start_or_attach(get_jdtls_config())
			end,
		})
	end,
}
