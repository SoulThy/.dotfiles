vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.scrolloff = 10

vim.opt.relativenumber = true
vim.opt.number = true

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  [!] Requires https://github.com/equalsraf/win32yank to use nvim-wsl with windows clipboard
vim.schedule(function()
    vim.g.clipboard = {
        name = 'win32yank-wsl',
        copy = {
            ['+'] = 'win32yank.exe -i --crlf',
            ['*'] = 'win32yank.exe -i --crlf',
        },
        paste = {
            ['+'] = 'win32yank.exe -o --lf',
            ['*'] = 'win32yank.exe -o --lf',
        },
        cache_enabled = 0,
    }

end)

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

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

-- Yank and Paste (win32yank)
vim.keymap.set('n', '<leader>y', '"+y', { noremap = true, silent = true, desc = 'Yank to system clipboard' })
vim.keymap.set('v', '<leader>y', '"+y', { noremap = true, silent = true, desc = 'Yank to system clipboard' })
vim.keymap.set('n', '<leader>p', '"+p', { noremap = true, silent = true, desc = 'Paste from system clipboard' })
vim.keymap.set('v', '<leader>p', '"+p', { noremap = true, silent = true, desc = 'Paste from system clipboard' })

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
