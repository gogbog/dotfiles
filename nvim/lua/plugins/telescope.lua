return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
        "folke/todo-comments.nvim",
    },
    config = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")

        local actions = require("telescope.actions")
        local transform_mod = require("telescope.actions.mt").transform_mod

        -- Custom filename display
        local function filenameFirst(_, path)
            local tail = vim.fs.basename(path)
            local parent = vim.fs.dirname(path)
            if parent == "." then return tail end
            return string.format("%s\t\t%s", tail, parent)
        end


        telescope.setup( {
            defaults = {
                path_display = { "smart" },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next, -- move to next result
                    },
                },
            },
            pickers = {
                find_files = {
                    path_display = filenameFirst,
                },
            },
        })

        telescope.load_extension("fzf")

        -- Autocommand for TelescopeResults highlighting
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "TelescopeResults",
            callback = function(ctx)
                vim.api.nvim_buf_call(ctx.buf, function()
                    vim.fn.matchadd("TelescopeParent", "\t\t.*$")
                    vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
                end)
            end,
        })

        -- Keymaps (optional: could move to keymaps.lua)
        local opts = { noremap = true, silent = true }
        vim.keymap.set('n', '<leader>pf', builtin.find_files, opts)
        vim.keymap.set('n', '<C-p>', builtin.git_files, opts)
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end, opts)

        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files', unpack(opts) })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep', unpack(opts) })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers', unpack(opts) })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags', unpack(opts) })
    end,
}
