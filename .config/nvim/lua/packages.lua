------------------------------------------------------------------------------------------------
----------------------------------------- PACKAGES.LUA -----------------------------------------
------------------------------------------------------------------------------------------------

require('packer').startup(function()
    use 'wbthomason/packer.nvim'                            -- Package manager
    use 'navarasu/onedark.nvim'                             -- Onedark themes collection
    use 'voldikss/vim-floaterm'                             -- Floating terminal
    use 'nvim-tree/nvim-tree.lua'                           -- File explorer
    use 'nvim-tree/nvim-web-devicons'                       -- Files icons(requirement for a couple of packages listed here)
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'                     -- Search tool(search files, text, keymaps etc.)
    use 'goolord/alpha-nvim'                                -- Homepage/greeter
    use 'nvim-lualine/lualine.nvim'                         -- Statusline
    use 'folke/trouble.nvim'                                -- Cool list with errors/warrnings/etc
    use {'nvim-treesitter/nvim-treesitter',                 -- Gets context for some things in files(like where functions start and end etc.), highlighing
        run = function()
            require('nvim-treesitter.install').update({ with_sync = true })
        end,
    }
    use 'neovim/nvim-lspconfig'                             -- Language server protocol(actually only configs for lsp)
    use {'ms-jpq/coq_nvim', branch = 'coq'}                 -- Suggestions list(when you start typing)
    use {'ms-jpq/coq.artifacts', branch = 'artifacts'}      -- Over 9000 snippets
    use {'ms-jpq/coq.thirdparty', branch = '3p'}            -- Some coq additional stuff
    use 'mfussenegger/nvim-dap'                             -- Debugger adapter protocol(for debugging)
    use 'rcarriga/nvim-dap-ui'                              -- UI for Dap
    use 'theHamsta/nvim-dap-virtual-text'                   -- Objects evaluation displayed next to the object when debugging code
    use 'cdelledonne/vim-cmake'                             -- CMake integration
    use 'windwp/nvim-autopairs'                             -- Automatically closes your brackets, apostrophes, quotations etc.
    use 'romgrk/barbar.nvim'                                -- Cool tabs in a bar
end)
