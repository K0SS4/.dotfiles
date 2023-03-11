------------------------------------------------------------------------------------------------
------------------------------------------ CONFIG.LUA ------------------------------------------
------------------------------------------------------------------------------------------------


-------------------------------------- NEOVIM --------------------------------------

-- Tab width
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- Line numbers
vim.opt.number = true;

vim.cmd[[set path='.,/usr/include,,~/.config/nvim/lua/**,']]
require('onedark').setup {
    style = 'darker'
}
require('onedark').load()

require('telescope').setup{
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden' -- thats the new thing
        },
    }
}

-------------------------------------- ALPHA-NVIM --------------------------------------

require 'alpha'.setup(require 'alpha.themes.startify'.opts)
local startify = require 'alpha.themes.startify'
startify.section.bottom_buttons.val = {
    startify.button('q', 'Quit vim', ':qa<CR>')
}

-------------------------------------- NVIM-TREE --------------------------------------

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- OR setup with some options
require('nvim-tree').setup({
  sort_by = 'case_sensitive',
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})

-------------------------------------- LUALINE --------------------------------------

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'dracula',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000, winbar = 1000,
        }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff'},
        lualine_c = {'filename'},
        lualine_x = {'diagnostics', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {},
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {
        'nvim-tree',
        'nvim-dap-ui'
    }
}

-------------------------------------- BARBAR --------------------------------------

require'bufferline'.setup {
    -- Enable/disable animations
    animation = true,

    -- Enable/disable auto-hiding the tab bar when there is a single buffer
    auto_hide = false,

    -- Enable/disable current/total tabpages indicator (top right corner)
    tabpages = false,

    -- Enable/disable close button
    closable = true,

    -- Enables/disable clickable tabs
    --  - left-click: go to buffer
    --  - middle-click: delete buffer
    clickable = true,

    -- Enables / disables diagnostic symbols
    diagnostics = {
        -- you can use a list
        {enabled = true},   -- ERROR
        {enabled = false},              -- WARN
        {enabled = false},              -- INFO
        {enabled = true}                -- HINT
    },

    -- Hide inactive buffers and file extensions. Other options are `alternate`, `current`, and `visible`.
    hide = {extensions = false, inactive = false},

    -- Disable highlighting alternate buffers
    highlight_alternate = false,

    -- Disable highlighting file icons in inactive buffers
    highlight_inactive_file_icons = false,

    -- Enable highlighting visible buffers
    highlight_visible = true,
    -- Enable/disable icons
    -- if set to 'numbers', will show buffer index in the tabline
    -- if set to 'both', will show buffer index and icons in the tabline
    icons = 'both',

    -- If set, the icon color will follow its corresponding buffer
    -- highlight group. By default, the Buffer*Icon group is linked to the
    -- Buffer* group (see Highlighting below). Otherwise, it will take its
    -- default value as defined by devicons.
    icon_custom_colors = false,

    -- Configure icons on the bufferline.
    icon_separator_active = '▎',
    icon_separator_inactive = '▎',
    icon_close_tab = '',
    icon_close_tab_modified = '●',
    icon_pinned = '車',

    -- If true, new buffers will be inserted at the start/end of the list.
    -- Default is to insert after current buffer.
    insert_at_end = false,
    insert_at_start = false,

    -- Sets the maximum padding width with which to surround each tab
    maximum_padding = 2,

    -- Sets the minimum padding width with which to surround each tab
    minimum_padding = 1,

    -- Sets the maximum buffer name length.
    maximum_length = 30,

    -- If set, the letters for each buffer in buffer-pick mode will be
    -- assigned based on their name. Otherwise or in case all letters are
    -- already assigned, the behavior is to assign letters in order of
    -- usability (see order below)
    semantic_letters = true,

    -- New buffer letters are assigned in this order. This order is
    -- optimal for the qwerty keyboard layout but might need adjustement
    -- for other layouts.
    letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',

    -- Sets the name of unnamed buffers. By default format is '[Buffer X]'
    -- where X is the buffer number. But only a static string is accepted here.
    no_name_title = nil,
}

-------------------------------------- FLOATERM --------------------------------------

vim.g.floaterm_wintype = 'split'
vim.g.floaterm_height = 15

-------------------------------------- AUTOPAIRS --------------------------------------

require'nvim-autopairs'.setup()

-------------------------------------- TROUBLE --------------------------------------

require'trouble'.setup{
    position = 'bottom', -- position of the list can be: bottom, top, left, right
    height = 7, -- height of the trouble list when position is top or bottom
    width = 50, -- width of the list when position is left or right
    icons = true, -- use devicons for filenames
    mode = 'workspace_diagnostics', -- 'workspace_diagnostics', 'document_diagnostics', 'quickfix', 'lsp_references', 'loclist'
    fold_open = '', -- icon used for open folds
    fold_closed = '', -- icon used for closed folds
    group = true, -- group results by file
    padding = true, -- add an extra new line on top of the list
    action_keys = { -- key mappings for actions in the trouble list
        -- map to {} to remove a mapping, for example:
        -- close = {},
        close = 'q', -- close the list
        cancel = '<esc>', -- cancel the preview and get back to your last window / buffer / cursor
        refresh = 'r', -- manually refresh
        jump = {'<cr>', '<tab>'}, -- jump to the diagnostic or open / close folds
        open_split = { '<c-x>' }, -- open buffer in new split
        open_vsplit = { '<c-v>' }, -- open buffer in new vsplit
        open_tab = { '<c-t>' }, -- open buffer in new tab
        jump_close = {'o'}, -- jump to the diagnostic and close the list
        toggle_mode = 'm', -- toggle between 'workspace' and 'document' diagnostics mode
        toggle_preview = 'P', -- toggle auto_preview
        hover = 'K', -- opens a small popup with the full multiline message
        preview = 'p', -- preview the diagnostic location
        close_folds = {'zM', 'zm'}, -- close all folds
        open_folds = {'zR', 'zr'}, -- open all folds
        toggle_fold = {'zA', 'za'}, -- toggle fold of current file
        previous = 'k', -- previous item
        next = 'j' -- next item
    },
    indent_lines = true, -- add an indent guide below the fold icons
    auto_open = true, -- automatically open the list when you have diagnostics
    auto_close = true, -- automatically close the list when you have no diagnostics
    auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
    auto_fold = false, -- automatically fold a file trouble list at creation
    auto_jump = {'lsp_definitions'}, -- for the given modes, automatically jump if there is only a single result
    signs = {},
    use_diagnostic_signs = true -- enabling this will use the signs defined in your lsp client
}

-------------------------------------- TREESITTER --------------------------------------

require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or 'all'
    ensure_installed = { 'c', 'cpp', 'c_sharp', 'cmake', 'diff', 'fish', 'json', 'python', 'regex', 'bash', 'lua', 'vim', 'help', 'query' },
    highlight = {
        enable = true,
    },
    indent = {
        enable = false,
    }
}

-------------------------------------- LSP AND COQ --------------------------------------

vim.g.coq_settings = { auto_start = 'shut-up' }
local lsp = require('lspconfig')
local coq = require('coq')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}
vim.cmd[[let g:cmake_link_compile_commands = 1]]

lsp['lua_ls'].setup(
    coq.lsp_ensure_capabilities({
        capabilities = capabilities,
        settings = {
            Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT',
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = {'vim', 'use'},
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file('', true),
                },
                telemetry = {
                    enable = false,
                },
            },
        },
    })
)

lsp['ccls'].setup(
    coq.lsp_ensure_capabilities({
        capabilities = capabilities,
  })
)

-------------------------------------- DAP ADAPTERS --------------------------------------

-- C/C++/Rust
local dap = require('dap')
dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
    name = 'lldb'
}

-------------------------------------- DAP CONFIGURATIONS --------------------------------------

-- C/C++/Rust
dap.configurations.cpp = {
    {
        env = function() -- By default lldb-vscode doesn't inherit the env variables from the parent. This enables inheritance
            local variables = {}
            for k, v in pairs(vim.fn.environ()) do
                table.insert(variables, string.format('%s=%s', k, v))
            end
            return variables
        end,

        name = 'Launch',
        type = 'lldb',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
    },
}

-- If you want to use this for Rust and C, add something like this:
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

-------------------------------------- DAP-UI --------------------------------------

local dapui = require('dapui')
dapui.setup({
    layouts = { {
        elements = { {
            id = 'scopes',
            size = 0.25
          }, {
            id = 'breakpoints',
            size = 0.25
          }, {
            id = 'stacks',
            size = 0.25
          }, {
            id = 'repl',
            size = 0.25
          } },
        position = 'left',
        size = 40
      }, {
        elements = { {
            id = 'watches',
            size = 1.0
          } },
        position = 'bottom',
        size = 10
      }
  },
})
dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
  dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close()
end

-------------------------------------- DAP-UI --------------------------------------

require'nvim-dap-virtual-text'.setup({})
