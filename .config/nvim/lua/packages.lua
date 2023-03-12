------------------------------------------------------------------------------------------------
----------------------------------------- PACKAGES.LUA -----------------------------------------
------------------------------------------------------------------------------------------------

require('packer').startup(function()
    use 'wbthomason/packer.nvim'                                    -- Package manager
    use 'navarasu/onedark.nvim'                                     -- Onedark themes collection
    use 'nvim-tree/nvim-tree.lua'                                   -- File explorer
    use 'nvim-tree/nvim-web-devicons'                               -- Files icons(requirement for a couple of packages listed here)
    use 'nvim-lua/plenary.nvim'                                     -- Lua functions collection(requirement for a couple of packages listed here)
    use 'nvim-telescope/telescope.nvim'                             -- Search tool(search files, text, keymaps etc.)
    use 'goolord/alpha-nvim'                                        -- Homepage/greeter
    use 'nvim-lualine/lualine.nvim'                                 -- Statusline
    use 'folke/trouble.nvim'                                        -- Cool list with errors/warrnings/etc
    use {'nvim-treesitter/nvim-treesitter',  run = ':TSUpdate'}     -- Gets context for some things in files(like where functions start and end etc.), highlighing
    use 'neovim/nvim-lspconfig'                                     -- Easy configs for LSPs
    use 'hrsh7th/nvim-cmp'                                          -- Suggestion window
    use 'hrsh7th/cmp-nvim-lsp'                                      -- Suggestions based on lsp
    use 'hrsh7th/cmp-buffer'                                        -- Suggestions based on current buffer
    use 'hrsh7th/cmp-path'                                          -- Suggestions based on path(directories/files etc.)
    use 'hrsh7th/cmp-cmdline'                                       -- Suggestions based on commands
    use 'hrsh7th/cmp-vsnip'                                         -- Suggestions based on vim-vsnip
    use 'hrsh7th/vim-vsnip'                                         -- Snippet engine
    use 'mfussenegger/nvim-dap'                                     -- Debugger adapter protocol(for debugging)
    use 'rcarriga/nvim-dap-ui'                                      -- UI for Dap
    use 'theHamsta/nvim-dap-virtual-text'                           -- Objects evaluation displayed next to the object when debugging code
    use 'cdelledonne/vim-cmake'                                     -- CMake integration
    use 'windwp/nvim-autopairs'                                     -- Automatically closes your brackets, apostrophes, quotations etc.
    use 'romgrk/barbar.nvim'                                        -- Cool tabs in a bar
    use 'tpope/vim-fugitive'                                        -- Git wrapper
    use 'ThePrimeagen/vim-be-good'                                  -- Fun little vim game
end)
