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

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

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
