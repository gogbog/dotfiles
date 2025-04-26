-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use({
        'airblade/vim-rooter',
        setup = function()
            vim.g.rooter_manual_only = 1
        end,
        config = function()
            vim.cmd('Rooter')
        end,
    })

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use 'navarasu/onedark.nvim'


    use {"folke/tokyonight.nvim"}

    use({ 'rose-pine/neovim', as = 'rose-pine' })
    -- vim.cmd('colorscheme rose-pine')

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use('nvim-lua/plenary.nvim')
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('karb94/neoscroll.nvim')
    use('maxmellon/vim-jsx-pretty')
    use('ahmedkhalf/project.nvim')
    use('zyedidia/vim-snake')
    use('eandrju/cellular-automaton.nvim')
    use('ThePrimeagen/vim-be-good')
    use {'numToStr/Comment.nvim'}

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }

    use {'mfussenegger/nvim-jdtls'}

    use({
        'famiu/bufdelete.nvim',
        config = function()
            vim.keymap.set('n', '<Leader>q', ':Bdelete<CR>')
        end,
    })

    use({
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        after = 'onedark.nvim'
    })

    use({
        'nvim-lualine/lualine.nvim',
        requires = 'kyazdani42/nvim-web-devicons'
    })


    use { 'nvim-tree/nvim-tree.lua' }
end)
