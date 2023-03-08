-- Tab width
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- Line numbers
vim.opt.number = true;

vim.cmd[[set path='.,/usr/include,,~/.config/nvim/lua/**,']]
vim.cmd[[colorscheme monokai]]

-- Alpha Nvim
require 'alpha'.setup(require 'alpha.themes.startify'.opts)
local startify = require 'alpha.themes.startify'
startify.section.bottom_buttons.val = {
    startify.button("q", "Quit vim", ":qa<CR>")
}

-- Treesitter
require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = { "c", "cpp", "c_sharp", "cmake", "diff", "fish", "json", "python", "regex", "bash", "lua", "vim", "help", "query" },
    highlight = {
        enable = true,
    },
    indent = {
        enable = false,
    }
}

--LSP and coq
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
                    library = vim.api.nvim_get_runtime_file("", true),
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
