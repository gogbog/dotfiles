return {
    'MagicDuck/grug-far.nvim',
    config = function()
        require('grug-far').setup({})

        vim.api.nvim_set_keymap(
            'n',
            '<leader>fr',
            "<cmd>lua require('grug-far').open({ open = 'vsplit' })<CR>",
            { noremap = true, silent = true }
        )
    end
}

