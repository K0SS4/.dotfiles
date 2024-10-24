--------------------------
------------------------------------------ CONFIG.LUA ------------------------------------------
------------------------------------------------------------------------------------------------


-------------------------------------- NEOVIM --------------------------------------

-- Tab width
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- Line numbers
vim.opt.number = true;
vim.opt.relativenumber = false

-- Incremental search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-------------------------------------- THEME --------------------------------------

vim.cmd[[set path='.,/usr/include,,~/.config/nvim/lua/**,']]
require('onedark').setup ({
    transparent = true
})
vim.cmd[[colorscheme onedark]]
-------------------------------------- TELESCOPE --------------------------------------

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
        theme = 'onedark',
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
        lualine_c = {''},
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

vim.g.barbar_auto_setup = false -- disable auto-setup
require'barbar'.setup {
  -- WARN: do not copy everything below into your config!
  --       It is just an example of what configuration options there are.
  --       The defaults are suitable for most people.

  -- Enable/disable animations
  animation = true,

  -- Enable/disable auto-hiding the tab bar when there is a single buffer
  auto_hide = false,

  -- Enable/disable current/total tabpages indicator (top right corner)
  tabpages = true,

  -- Enables/disable clickable tabs
  --  - left-click: go to buffer
  --  - middle-click: delete buffer
  clickable = true,

  -- Excludes buffers from the tabline
  exclude_ft = {'javascript'},
  exclude_name = {'package.json'},

  -- A buffer to this direction will be focused (if it exists) when closing the current buffer.
  -- Valid options are 'left' (the default) and 'right'
  focus_on_close = 'left',

  -- Hide inactive buffers and file extensions. Other options are `alternate`, `current`, and `visible`.
  hide = {extensions = false, inactive = false},

  -- Disable highlighting alternate buffers
  highlight_alternate = false,

  -- Disable highlighting file icons in inactive buffers
  highlight_inactive_file_icons = false,

  -- Enable highlighting visible buffers
  highlight_visible = true,

  icons = {
    -- Configure the base icons on the bufferline.
    buffer_index = false,
    buffer_number = false,
    button = '',
    -- Enables / disables diagnostic symbols
    diagnostics = {
      [vim.diagnostic.severity.ERROR] = {enabled = true, icon = 'ﬀ'},
      [vim.diagnostic.severity.WARN] = {enabled = false},
      [vim.diagnostic.severity.INFO] = {enabled = false},
      [vim.diagnostic.severity.HINT] = {enabled = true},
    },
    filetype = {
      -- Sets the icon's highlight group.
      -- If false, will use nvim-web-devicons colors
      custom_colors = false,

      -- Requires `nvim-web-devicons` if `true`
      enabled = true,
    },
    separator = {left = '▎', right = ''},

    -- Configure the icons on the bufferline when modified or pinned.
    -- Supports all the base icon options.
    modified = {button = '●'},
    pinned = {button = '車', filename = true, separator = {right = ''}},

    -- Configure the icons on the bufferline based on the visibility of a buffer.
    -- Supports all the base icon options, plus `modified` and `pinned`.
    alternate = {filetype = {enabled = false}},
    current = {buffer_index = true},
    inactive = {button = '×'},
    visible = {modified = {buffer_number = false}},
  },

  -- If true, new buffers will be inserted at the start/end of the list.
  -- Default is to insert after current buffer.
  insert_at_end = false,
  insert_at_start = false,

  -- Sets the maximum padding width with which to surround each tab
  maximum_padding = 1,

  -- Sets the minimum padding width with which to surround each tab
  minimum_padding = 1,

  -- Sets the maximum buffer name length.
  maximum_length = 30,

  -- If set, the letters for each buffer in buffer-pick mode will be
  -- assigned based on their name. Otherwise or in case all letters are
  -- already assigned, the behavior is to assign letters in order of
  -- usability (see order below)
  semantic_letters = true,

  -- Set the filetypes which barbar will offset itself for
  sidebar_filetypes = {
    -- Use the default values: {event = 'BufWinLeave', text = nil}
    NvimTree = true,
    -- Or, specify the text used for the offset:
    undotree = {text = 'undotree'},
    -- Or, specify the event which the sidebar executes when leaving:
    ['neo-tree'] = {event = 'BufWipeout'},
    -- Or, specify both
    Outline = {event = 'BufWinLeave', text = 'symbols-outline'},
  },

  -- New buffer letters are assigned in this order. This order is
  -- optimal for the qwerty keyboard layout but might need adjustment
  -- for other layouts.
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',

  -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
  -- where X is the buffer number. But only a static string is accepted here.
  no_name_title = nil,
}

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
    ensure_installed = { 'c', 'cpp', 'c_sharp', 'cmake', 'diff', 'fish', 'gitignore', 'json', 'python', 'regex', 'bash', 'lua', 'vim', 'query', 'haskell', 'markdown', 'sql', 'json' },
    highlight = {
        enable = true,
    },
    indent = {
        enable = false,
    }
}

-------------------------------------- COMMENT --------------------------------------

require'Comment'.setup()

-------------------------------------- CMAKE --------------------------------------

vim.g.cmake_link_compile_commands = 1
vim.g.cmake_statusline = 1
vim.g.cmake_build_dir_location = 'build'
vim.g.cmake_console_size = 10
vim.g.cmake_console_position = 'topleft'

-------------------------------------- CMP --------------------------------------

local cmp = require'cmp'

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn['vsnip#anonymous'](args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp', keyword_length = 2 },
        { name = 'vsnip' },
    },
    {
        { name = 'buffer', keyword_length = 2 },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    },
    {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    },
    {
        { name = 'cmdline' }
    })
})

-- Disable popup in comments
cmp.setup({
    enabled = function()
      -- disable completion in comments
      local context = require 'cmp.config.context'
      -- keep command mode completion enabled when cursor is in a comment
      if vim.api.nvim_get_mode().mode == 'c' then
        return true
      else
        return not context.in_treesitter_capture('comment')
          and not context.in_syntax_group('Comment')
      end
    end
})

-------------------------------------- LSP  --------------------------------------

-- CMP lspconfig integration
local cap = require('cmp_nvim_lsp').default_capabilities()
local lsp = require('lspconfig')

cap.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

lsp['lua_ls'].setup({
    capabilities = cap,
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
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

lsp['clangd'].setup({
        capabilities = cap,
})

lsp['rust_analyzer'].setup({
    capabilities = cap,
})


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
dap.configurations.cpp = {{
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
        -- My weird function for searching build directory for executables when dap fires
        program = function()
            local exec = ''
            for dir in io.popen('file ' .. vim.fn.getcwd() .. '/build/Debug/*'):lines() do
                local ft = {}
                for k in string.gmatch(dir, '[^:]+') do table.insert(ft, k) end
                ft[2] = string.gsub(ft[2], '%s', '')
                if string.sub(ft[2], 1, 3) == 'ELF' then
                    exec = ft[1]
                    break
                end
            end
            if exec == '' then
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            else
                return exec
            end
        end,
        cwd = '${workspaceFolder}/build/Debug',
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
