return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
        { 'mfussenegger/nvim-jdtls' },
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf, silent = true }

				-- set keybinds
				opts.desc = "Show LSP references"
				keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

				opts.desc = "Show LSP definitions"
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

				opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

				opts.desc = "Go to next diagnostic"
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
			end,
		})

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "E",
					[vim.diagnostic.severity.WARN] = "W",
					[vim.diagnostic.severity.HINT] = "H",
					[vim.diagnostic.severity.INFO] = "I",
				},
			},
		})

		vim.lsp.config("*", {
			capabilities = capabilities,
		})

        -- disable tsserver & ts_ls (if mason tries to install them)
        -- vim.lsp.disable("tsserver")
        -- vim.lsp.disable("jdtls")

          -- enable vtsls
        vim.lsp.config("vtsls", {
            capabilities = capabilities,
            filetypes = {
                "javascript",
                "javascriptreact",
                "javascript.jsx",
                "typescript",
                "typescriptreact",
                "typescript.tsx",
            },
            settings = {
                vtsls = {
                    enableMoveToFileCodeAction = true,
                    autoUseWorkspaceTsdk = true,
                    experimental = {
                        maxInlayHintLength = 30,
                        completion = {
                            enableServerSideFuzzyMatch = true,
                        },
                    },
                },
                typescript = {
                    inlayHints = {
                        enumMemberValues = { enabled = true },
                        functionLikeReturnTypes = { enabled = true },
                        parameterNames = { enabled = "literals" },
                        parameterTypes = { enabled = true },
                        propertyDeclarationTypes = { enabled = true },
                        variableTypes = { enabled = false },
                    },
                    suggest = {
                        completeFunctionCalls = true,
                    },
                    updateImportsOnFileMove = { enabled = "always" },
                },
            },
        })

		vim.lsp.config("yamlls", {
			capabilities = capabilities,
			settings = {
				yaml = {
					format = {
						enable = true,
					},
					schemaStore = {
						enable = true,
					},
				},
			},
		})

		-- Custom config for gopls
        -- vim.lsp.config("gopls", {
        --   settings = {
        --     gopls = {
        --       -- Use gofumpt for formatting (stricter version of gofmt)
        --       gofumpt = true,
        --
        --       -- Inline hints shown in your code (like variable types, parameter names, etc.)
        --       hints = {
        --         assignVariableTypes = true,      -- Show type when assigning to a new variable
        --         compositeLiteralFields = true,   -- Show field names in composite literals
        --         compositeLiteralTypes = true,    -- Show type names in composite literals
        --         constantValues = true,           -- Show constant values
        --         functionTypeParameters = true,   -- Show type parameters on functions
        --         parameterNames = true,           -- Show parameter names in function calls
        --         rangeVariableTypes = true,       -- Show variable types in range loops
        --       },
        --
        --       codelenses = {
        --         gc_details = false,
        --         generate = true,
        --         regenerate_cgo = true,
        --         run_govulncheck = true,
        --         test = true,
        --         tidy = true,
        --         upgrade_dependency = true,
        --         vendor = true,
        --       },
        --
        --       -- Analyses: static checks performed by gopls (these run automatically)
        --       analyses = {
        --         nilness = true,          -- Detect possible nil pointer dereferences
        --         unusedparams = true,     -- Detect unused function parameters
        --         unusedwrite = true,      -- Detect unused writes to variables
        --         useany = true,           -- Flag improper use of 'any' type
        --         shadow = true,           -- Detect variable shadowing (from your config)
        --         ST1000 = false,          -- Disable "package comment required" check
        --         ST1020 = false,          -- Disable "exported func docstring must start with name" check
        --       },
        --
        --       -- Insert placeholders for function parameters when autocompleting
        --       usePlaceholders = true,
        --
        --       -- Autocomplete symbols from unimported packages
        --       completeUnimported = true,
        --
        --       -- Run extra static analysis (from the "staticcheck" suite)
        --       staticcheck = true,
        --
        --       -- Ignore these directories when scanning for packages
        --       directoryFilters = {
        --         "-.git",           -- Exclude .git folder
        --         "-.vscode",        -- Exclude VSCode configs
        --         "-.idea",          -- Exclude JetBrains configs
        --         "-.vscode-test",   -- Exclude VSCode test directories
        --         "-node_modules",   -- Exclude node_modules
        --       },
        --
        --       -- Enable semantic token highlighting (for better syntax colors)
        --       semanticTokens = true,
        --     },
        --   },
        -- })

        -- Workaround for gopls missing semanticTokensProvider support
        -- https://github.com/golang/go/issues/54531#issuecomment-1464982242
        -- vim.api.nvim_create_autocmd("LspAttach", {
        --   callback = function(args)
        --     local client = vim.lsp.get_client_by_id(args.data.client_id)
        --     if client and client.name == "gopls" and not client.server_capabilities.semanticTokensProvider then
        --       local semantic = client.config.capabilities.textDocument.semanticTokens
        --       client.server_capabilities.semanticTokensProvider = {
        --         full = true,
        --         legend = {
        --           tokenTypes = semantic.tokenTypes,
        --           tokenModifiers = semantic.tokenModifiers,
        --         },
        --         range = true,
        --       }
        --     end
        --   end,
        -- })


		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					completion = {
						callSnippet = "Replace",
					},
				},
			},
		})

        vim.api.nvim_create_autocmd('FileType', {
            pattern = 'java',
            callback = function (args)
                require('java.java_setup').setup()
            end

        })
	end,
}
