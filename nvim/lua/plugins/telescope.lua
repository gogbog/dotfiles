return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = {
        { '<C-p>', function() require("telescope.builtin").git_files() end, desc = "Git files" },
        { '<leader>ps', function() require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") }) end, desc = "Grep string" },
        { '<leader>ff', function() require("telescope.builtin").find_files() end, desc = "Telescope find files" },
        { '<leader>fg', function() require("telescope.builtin").live_grep() end, desc = "Telescope live grep" },
        { '<leader>fb', function() require("telescope.builtin").buffers() end, desc = "Telescope buffers" },
        { '<leader>fh', function() require("telescope.builtin").help_tags() end, desc = "Telescope help tags" },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
        "folke/todo-comments.nvim",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

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

    end,
}
