return {
    'MagicDuck/grug-far.nvim',
    keys = {
        { '<leader>fr', function() require('grug-far').open({ open = 'vsplit' }) end, desc = "Find and replace (grug-far)" },
    },
    opts = {},
}

