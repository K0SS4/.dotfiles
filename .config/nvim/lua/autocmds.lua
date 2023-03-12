------------------------------------------------------------------------------------------------
----------------------------------------- AUTOCMDS.LUA -----------------------------------------
------------------------------------------------------------------------------------------------

local exec = vim.api.nvim_exec
local autocmd = vim.api.nvim_create_autocmd
local autogroup = vim.api.nvim_create_augroup

-- Go to first error when cmake build fails
exec(
    [[
        let g:cmake_jump_on_error = 0 " We do not want to focus the console
	augroup vim-cmake-group
	    autocmd User CMakeBuildFailed cfirst
	augroup END
    ]], false
)

-- Close cmake window when build succeeded
exec(
    [[
	augroup vim-cmake-group
	    autocmd User CMakeBuildSucceeded CMakeClose
	augroup END
    ]], false
)

autogroup('bufcheck', {})
-- Return to last edit position when opening files
vim.api.nvim_create_autocmd('BufReadPost',  {
    group    = 'bufcheck',
    pattern  = '*',
    callback = function()
        if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
            vim.fn.setpos('.', vim.fn.getpos("'\""))
        end
    end
})

-- Reload config file on change
local conf = '/home/k0ss4/.config/nvim/'
autocmd('BufWritePost', {
    group    = 'bufcheck',
    pattern  = {conf..'*', conf..'lua/*'},
    command  = 'silent source %'
})

-- Close terminal buffer on process exit
autocmd('TermClose', {
    pattern = '',
    command = 'BufferClose'
})

-- Enter insert mode when terminal opens
autocmd('TermOpen', {
    pattern = '',
    command = 'startinsert'
})
