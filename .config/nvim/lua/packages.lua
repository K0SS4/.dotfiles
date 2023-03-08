require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    -- Extra
    use {'dracula/vim', as = 'dracula'}
    use 'tanvirtin/monokai.nvim'
    use 'voldikss/vim-floaterm'
    use 'kyazdani42/nvim-tree.lua'
    use {
        'nvim-telescope/telescope.nvim',
        requires = { "nvim-lua/plenary.nvim" },
    }
    use {
        'goolord/alpha-nvim',
        requires = { 'nvim-tree/nvim-web-devicons' },
    }

    -- IDE
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            require('nvim-treesitter.install').update({ with_sync = true })
        end,
    }
    use 'neovim/nvim-lspconfig'
    use {'ms-jpq/coq_nvim', branch = 'coq'} -- The coq himself
    use {'ms-jpq/coq.artifacts', branch = 'artifacts'} -- Over 9000 snippets
    use {'ms-jpq/coq.thirdparty', branch = '3p'} -- Some coq additional stuff
    use 'cdelledonne/vim-cmake'
end)
