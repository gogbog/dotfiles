return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy", -- lazy-load after startup
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
        options = {
            path = 1,
            section_separators = '',
            component_separators = '',
            globalstatus = true,
            theme = {
                normal = {
                    a = 'StatusLine',
                    b = 'StatusLine',
                    c = 'StatusLine',
                },
            },
        },
        sections = {
            lualine_a = {
                'mode',
                { '"▏"' },
            },
            lualine_b = {
                'branch',
                'diff',
                { '"▏"' },
                '"󰇥  " .. tostring(#vim.lsp.get_clients({bufnr = 0}))',
                { 'diagnostics', sources = { 'nvim_diagnostic' } },
                { '"▏"' },
            },
            lualine_c = { 'filename' },
            lualine_x = { 'filetype', 'encoding', 'fileformat' },
            lualine_y = {
                { '"▏"' },
                'hostname',
                { '"▏"' },
            },
            lualine_z = { 'location', 'progress' },
        },
    },
}

