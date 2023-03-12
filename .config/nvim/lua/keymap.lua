------------------------------------------------------------------------------------------------
------------------------------------------ KEYMAP.LUA ------------------------------------------
------------------------------------------------------------------------------------------------

local keymap = vim.api.nvim_set_keymap

-- Leader key
vim.g.mapleader = '<Space>'

-------------------------------------- NATIVE --------------------------------------
keymap('n', '<c-s>', ':w<CR>', {silent = true, noremap = true, desc = 'Save'})
keymap('i', '<c-s>', '<Esc>:w<CR>a', {silent = true, noremap = true, desc = 'Save'})

keymap('n', '<c-h>', '<c-w>h', {silent = true, noremap = true, desc = 'Move right'})
keymap('n', '<c-j>', '<c-w>j', {silent = true, noremap = true, desc = 'Move down'})
keymap('n', '<c-k>', '<c-w>k', {silent = true, noremap = true, desc = 'Move up'})
keymap('n', '<c-l>', '<c-w>l', {silent = true, noremap = true, desc = 'Move left'})

keymap('v', '<Tab>', '>', {silent = true, noremap = true, desc = 'Indent'})
keymap('v', '<s-Tab>', '<', {silent = true, noremap = true, desc = 'Outdent'})

keymap('n', '<leader>t', ':term<cr>', {silent = true, noremap = true, desc = 'Open terminal'})

-------------------------------------- ALPHA-NVIM --------------------------------------
keymap('n', '<c-n>', ':Alpha<CR>', {silent = true, noremap = true, desc = 'Start alphavim'})

-------------------------------------- NVIM-TREE --------------------------------------
keymap('n', '<leader>tt', ':NvimTreeToggle<cr>', {silent = true, noremap = true, desc = 'Toggle NvimTree'})

-------------------------------------- TROUBLE --------------------------------------
keymap('n', '<leader>xx', ':TroubleToggle workspace_diagnostics<cr>', {silent = true, noremap = true, desc = 'Trouble Workspace'})
keymap('n', '<leader>qf', ':TroubleToggle quickfix<cr><esc>', {silent = true, noremap = true, desc = 'Trouble Quickfix'})

-------------------------------------- BARBAR --------------------------------------
keymap('n', '<s-l>', ':BufferNext<cr>', {silent = true, noremap = true, desc = 'Next buffer'})
keymap('n', '<s-h>', ':BufferPrevious<cr>', {silent = true, noremap = true, desc = 'Previous buffer'})
keymap('n', '<s-w>', ':BufferClose<cr>', {silent = true, noremap = true, desc = 'Close current buffer'})
-- Mapping alt+{1-9} to go to buffer
for i=1,9 do
    keymap('n', '<a-' .. i ..'>', ':BufferGoto ' .. i .. '<cr>', {silent = true, noremap = true, desc = 'Go to bufffer ' .. i})
end

-------------------------------------- LSP --------------------------------------
keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', {silent = true, noremap = true, desc = 'Go to definition'})
keymap('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', {silent = true, noremap = true, desc = 'Go to declaration'})
keymap('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', {silent = true, noremap = true, desc = 'Go to implementation'})
keymap('n', 'gw', ':lua vim.lsp.buf.document_symbol()<CR>', {silent = true, noremap = true, desc = ''})
keymap('n', 'gw', ':lua vim.lsp.buf.workspace_symbol()<CR>', {silent = true, noremap = true, desc = ''})
keymap('n', 'gr', ':lua vim.lsp.buf.references()<CR>', {silent = true, noremap = true, desc = 'Show references'})
keymap('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>', {silent = true, noremap = true, desc = 'Go to type definition'})
keymap('n', 'K', ':lua vim.lsp.buf.hover()<CR>', {silent = true, noremap = true, desc = 'Show context'})
keymap('n', '<c-s-k>', ':lua vim.lsp.buf.signature_help()<CR>', {silent = true, noremap = true, desc = ''})
keymap('n', '<leader>af', ':lua vim.lsp.buf.code_action()<CR>', {silent = true, noremap = true, desc = ''})
keymap('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>', {silent = true, noremap = true, desc = 'Rename'})

-------------------------------------- DAP --------------------------------------
keymap('n', '<F1>', ':lua require"dap".continue()<cr>', {silent = true, noremap = true, desc = 'Debugger: Continue'})
keymap('n', '<F2>', ':lua require"dap".step_into()<cr>', {silent = true, noremap = true, desc = 'Debugger: Step Into'})
keymap('n', '<F3>', ':lua require"dap".step_out()<cr>', {silent = true, noremap = true, desc = 'Debugger: Step Out'})
keymap('n', '<F4>', ':lua require"dap".step_over()<cr>', {silent = true, noremap = true, desc = 'Debugger: Step Over'})
keymap('n', '<F9>', ':lua require"dap".toggle_breakpoint()<cr>', {silent = true, noremap = true, desc = 'Debugger: Set breakpoint'})
keymap('n', '<leader>sd', ':lua require"dap".close()<cr>', {silent = true, noremap = true, desc = 'Debugger: Stop'})
keymap('n', '<C>', '<cmd>lua require("dapui").eval()<CR>', {silent = true, noremap = true, desc = ''})
keymap('v', '<c-s-c>', '<cmd>lua require("dapui").eval()<CR>', {silent = true, noremap = true, desc = ''})

-------------------------------------- CMAKE --------------------------------------
keymap('', '<leader>cg', ':CMakeGenerate<CR>', {silent = true, noremap = true, desc = 'Generate CMake'})
keymap('', '<leader>cb', ':CMakeBuild<CR>', {silent = true, noremap = true, desc = 'Build CMake'})
keymap('', '<leader>cq', ':CMakeClose<CR>', {silent = true, noremap = true, desc = 'Close CMake'})
keymap('', '<leader>cc', ':CMakeClean<CR>', {silent = true, noremap = true, desc = 'Clean CMake'})
keymap('', '<leader>bd', ':lua Build_and_debug()<cr>', {silent = true, noremap = true, desc = 'Build and debug'})

-------------------------------------- TELESCOPE --------------------------------------
keymap('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files({hidden = true})<CR>', {silent = true, noremap = true, desc = 'Find files'})
keymap('n', '<leader>fk', '<cmd>lua require("telescope.builtin").keymaps()<CR>', {silent = true, noremap = true, desc = 'Show keymaps'})
keymap('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<CR>', {silent = true, noremap = true, desc = 'Live grep'})
keymap('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<CR>', {silent = true, noremap = true, desc = 'Search buffers'})
keymap('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<CR>', {silent = true, noremap = true, desc = 'Search help tags'})
