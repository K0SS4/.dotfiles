local opts = { noremap = true }
local keymap = vim.api.nvim_set_keymap

-- Some lazy functions

local function nkeymap(key, map)
    keymap('n', key, map, opts)
end

local function vkeymap(key, map)
    keymap('v', key, map, opts)
end

local function ikeymap(key, map)
    keymap('i', key, map, opts)
end


-- Ctrl + S for saving
nkeymap('<c-s>', ':w<CR>')
ikeymap('<c-s>', '<Esc>:w<CR>a')

-- Ctrl + h/j/k/l for cycling through splits
nkeymap('<c-h>', '<c-w>h')
nkeymap('<c-j>', '<c-w>j')
nkeymap('<c-k>', '<c-w>k')
nkeymap('<c-l>', '<c-w>l')

-- Ctrl + n opens alpha nvim
nkeymap('<c-n>', ':Alpha<CR>')

-- Tab and Shift + Tab in visual mode
vkeymap('<Tab>', '>')
vkeymap('<s-Tab>', '<')

-- Lua LSP keymaps
nkeymap('gd', ':lua vim.lsp.buf.definition()<cr>')
nkeymap('gD', ':lua vim.lsp.buf.declaration()<cr>')
nkeymap('gi', ':lua vim.lsp.buf.implementation()<cr>')
nkeymap('gw', ':lua vim.lsp.buf.document_symbol()<cr>')
nkeymap('gw', ':lua vim.lsp.buf.workspace_symbol()<cr>')
nkeymap('gr', ':lua vim.lsp.buf.references()<cr>')
nkeymap('gt', ':lua vim.lsp.buf.type_definition()<cr>')
nkeymap('K', ':lua vim.lsp.buf.hover()<cr>')
nkeymap('<c-k>', ':lua vim.lsp.buf.signature_help()<cr>')
nkeymap('<leader>af', ':lua vim.lsp.buf.code_action()<cr>')
nkeymap('<leader>rn', ':lua vim.lsp.buf.rename()<cr>')

-- CMake
keymap('', '<leader>cg', ':CMakeGenerate<cr>', {})
keymap('', '<leader>cb', ':CMakeBuild<cr>', {})
keymap('', '<leader>cq', ':CMakeClose<cr>', {})
keymap('', '<leader>cc', ':CMakeClean<cr>', {})

-- Telescope
nkeymap('<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>")
nkeymap('<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>")
nkeymap('<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>")
nkeymap('<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>")

-- floaterm
vim.cmd[[let g:floaterm_keymap_toggle = '<Leader>f']]
vim.cmd[[let g:floaterm_wintype = 'split']]
