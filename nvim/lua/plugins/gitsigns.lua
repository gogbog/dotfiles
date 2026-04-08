return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			add = { text = "┃" },
			change = { text = "┃" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		current_line_blame = false,
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol",
			delay = 500,
		},
		current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation between hunks
			map("n", "]c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "]c", bang = true })
				else
					gitsigns.nav_hunk("next")
				end
			end, { desc = "Next git hunk" })

			map("n", "[c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "[c", bang = true })
				else
					gitsigns.nav_hunk("prev")
				end
			end, { desc = "Previous git hunk" })

			-- Stage / reset hunks
			map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "Stage hunk" })
			map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Reset hunk" })
			map("v", "<leader>gs", function()
				gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "Stage selected hunk" })
			map("v", "<leader>gr", function()
				gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "Reset selected hunk" })

			-- Stage / reset buffer
			map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "Stage buffer" })
			map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "Reset buffer" })

			-- Preview & blame
			map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Preview hunk" })
			map("n", "<leader>gb", function()
				gitsigns.blame_line({ full = true })
			end, { desc = "Blame line" })

			-- Diff
			map("n", "<leader>gd", gitsigns.diffthis, { desc = "Diff this" })
			map("n", "<leader>gD", function()
				gitsigns.diffthis("~")
			end, { desc = "Diff against ~" })

			-- Toggles
			map("n", "<leader>gB", gitsigns.toggle_current_line_blame, { desc = "Toggle line blame" })

			-- Text object
			map({ "o", "x" }, "ih", gitsigns.select_hunk, { desc = "Select hunk" })
		end,
	},
}
