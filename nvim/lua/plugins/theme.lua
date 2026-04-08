return {

	{
		"folke/tokyonight.nvim",
		lazy = true,
		config = function()
			local transparent = true

			require("tokyonight").setup({
				style = "night",
				transparent = transparent,
				terminal_colors = true,
				styles = {
					comments = { italic = true },
					keywords = { italic = true },
					functions = { bold = true },
					variables = {},
					sidebars = transparent and "transparent" or "dark",
					floats = transparent and "transparent" or "dark",
				},
				lualine_bold = true,
				cache = true,
				plugins = {
					auto = true,
				},
				on_colors = function(colors)
					colors.hint = colors.orange
					if transparent then
						colors.fg_gutter = "#506477"
						colors.border = "#547998"
					end
				end,
				on_highlights = function(hl, c)
					if not transparent then
						return
					end

					-- Core UI
					hl.Normal = { fg = c.fg, bg = "NONE" }
					hl.NormalNC = { fg = c.fg, bg = "NONE" }
					hl.NormalFloat = { fg = c.fg_float, bg = "NONE" }
					hl.FloatBorder = { fg = c.border_highlight, bg = "NONE" }
					hl.FloatTitle = { fg = c.border_highlight, bg = "NONE", bold = true }
					hl.SignColumn = { fg = c.fg_gutter, bg = "NONE" }

					-- Window separators
					hl.WinSeparator = { fg = c.fg_gutter, bg = "NONE" }
					hl.VertSplit = { fg = c.fg_gutter, bg = "NONE" }

					-- Status line
					hl.StatusLine = { fg = c.fg_sidebar, bg = "NONE" }
					hl.StatusLineNC = { fg = c.fg_gutter, bg = "NONE" }
					hl.TabLineFill = { bg = "NONE" }

					-- Cursor line
					hl.CursorLine = { bg = c.bg_highlight }
					hl.CursorLineNr = { fg = c.orange, bold = true }

					-- Completion menu
					hl.Pmenu = { fg = c.fg, bg = "NONE" }
					hl.PmenuSel = { bg = c.bg_highlight, bold = true }
					hl.PmenuSbar = { bg = "NONE" }
					hl.PmenuThumb = { bg = c.fg_gutter }

					-- Telescope
					hl.TelescopeNormal = { fg = c.fg_dark, bg = "NONE" }
					hl.TelescopeBorder = { fg = c.border_highlight, bg = "NONE" }
					hl.TelescopePromptNormal = { bg = "NONE" }
					hl.TelescopePromptBorder = { fg = c.border_highlight, bg = "NONE" }
					hl.TelescopePromptTitle = { fg = c.blue, bg = "NONE", bold = true }
					hl.TelescopePreviewTitle = { fg = c.blue, bg = "NONE", bold = true }
					hl.TelescopeResultsTitle = { fg = c.blue, bg = "NONE", bold = true }
					hl.TelescopePreviewNormal = { bg = "NONE" }
					hl.TelescopeResultsNormal = { bg = "NONE" }

					-- Diagnostics
					hl.DiagnosticVirtualTextError = { fg = c.error, bg = "NONE" }
					hl.DiagnosticVirtualTextWarn = { fg = c.warning, bg = "NONE" }
					hl.DiagnosticVirtualTextInfo = { fg = c.info, bg = "NONE" }
					hl.DiagnosticVirtualTextHint = { fg = c.hint, bg = "NONE" }

					-- Git signs
					hl.GitSignsAdd = { fg = c.git.add, bg = "NONE" }
					hl.GitSignsChange = { fg = c.git.change, bg = "NONE" }
					hl.GitSignsDelete = { fg = c.git.delete, bg = "NONE" }

					-- Neo-tree
					hl.NeoTreeNormal = { fg = c.fg, bg = "NONE" }
					hl.NeoTreeNormalNC = { fg = c.fg, bg = "NONE" }
					hl.NeoTreeEndOfBuffer = { bg = "NONE" }

					-- Notify
					hl.NotifyBackground = { bg = c.bg }

					-- End of buffer ~ lines
					hl.EndOfBuffer = { fg = c.bg_highlight, bg = "NONE" }

					-- Treesitter Context
					hl.TreesitterContext = { bg = "NONE" }
					hl.TreesitterContextLineNumber = { fg = c.fg_gutter, bg = "NONE" }
				end,
			})
		end,
	},

	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato",
				background = {
					light = "latte",
					dark = "mocha",
				},
				transparent_background = false,
				term_colors = true,
				float = {
					transparent = false,
					solid = false,
				},
				dim_inactive = {
					enabled = true,
					shade = "dark",
					percentage = 0.15,
				},
				styles = {
					comments = { "italic" },
					conditionals = { "italic" },
					loops = {},
					functions = {},
					keywords = {},
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = {},
					operators = {},
				},
				integrations = {
					cmp = true,
					gitsigns = true,
					neotree = true,
					treesitter_context = true,
					telescope = { enabled = true },
					notify = true,
					noice = true,
					neotest = true,
					fidget = true,
					flash = true,
					mason = true,
					lsp_trouble = true,
					native_lsp = {
						enabled = true,
						underlines = {
							errors = { "underline" },
							hints = { "underline" },
							warnings = { "underline" },
							information = { "underline" },
						},
					},
				},
			})
			end,
	},

	{
		"rebelot/kanagawa.nvim",
		lazy = true,
		opts = {
			transparent = false,
			term_colors = true,
		},
	},
}
