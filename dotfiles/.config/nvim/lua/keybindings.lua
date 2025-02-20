-- Keybindings
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Keybindings for buffers navigation
vim.keymap.set('n', '<leader><leader>', ':b#<CR>', { desc = 'Toggle between the two most recent buffers' })
vim.keymap.set('n', '[b', ':bprev<CR>', { desc = 'Go to previous buffer' })
vim.keymap.set('n', ']b', ':bnext<CR>', { desc = 'Go to next buffer' })

-- Keybindings from terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true , desc = 'Exit terminal mode with Escape'})
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w><C-h>', { desc = 'Move focus to the left window from terminal' })
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w><C-l>', { desc = 'Move focus to the right window from terminal' })
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w><C-j>', { desc = 'Move focus to the lower window from terminal' })
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w><C-k>', { desc = 'Move focus to the upper window from terminal' })

vim.keymap.set('t', '<C-J>', '<C-J>', { noremap = true, silent = true, desc = 'Make ctrl+enter function in terminal as intended' })

-- Yank and Paste (win32yank)
vim.keymap.set('n', '<leader>y', '"+y', { noremap = true, silent = true, desc = 'Yank to system clipboard' })
vim.keymap.set('v', '<leader>y', '"+y', { noremap = true, silent = true, desc = 'Yank to system clipboard' })
vim.keymap.set('n', '<leader>p', '"+p', { noremap = true, silent = true, desc = 'Paste from system clipboard' })
vim.keymap.set('v', '<leader>p', '"+p', { noremap = true, silent = true, desc = 'Paste from system clipboard' })

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Open terminal to the right side

local function openTerminalRight()
    vim.cmd("rightbelow vsplit")
    vim.cmd("terminal")
    vim.cmd("vertical resize 40")
end

vim.keymap.set('n', '<C-w>t', openTerminalRight, {noremap = true, silent = true, desc = 'Open [T]erminal on the right side'})

