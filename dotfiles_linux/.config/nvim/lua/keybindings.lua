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

-- ! sudo apt install xclip
-- Clipboard: Copy
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Copy to clipboard" })
vim.keymap.set("n", "<leader>Y", '"+yg_', { desc = "Copy to clipboard to end of line" })
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Copy to clipboard" })
vim.keymap.set("n", "<leader>yy", '"+yy', { desc = "Copy line to clipboard" })

-- Clipboard: Paste
vim.keymap.set("n", "<leader>p", '"+p', { desc = "Paste after from clipboard" })
vim.keymap.set("n", "<leader>P", '"+P', { desc = "Paste before from clipboard" })
vim.keymap.set("v", "<leader>p", '"+p', { desc = "Paste after from clipboard" })
vim.keymap.set("v", "<leader>P", '"+P', { desc = "Paste before from clipboard" })

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Keybindings for development in nvim
vim.keymap.set('n', '<leader>sm', function() vim.cmd('source %') print('Sourced Current File! :)') end, {desc = '[S]ource [M]e, source current file'})
vim.keymap.set('n', '<leader>x', ':.lua<CR>', {noremap = true, desc = 'E[X]ecute the current line of lua'})
vim.keymap.set('v', '<leader>x', ':lua<CR>', {noremap = true, desc = 'E[X]ecute the selected lines of lua'})

-- Script to Open Terminal on the Right side
local function openTerminalRight()
    local terminal_bufnr = nil
    local terminal_win = nil

    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        local buf_type = vim.api.nvim_get_option_value('buftype', {buf = buf})
        if buf_type == 'terminal' then
            terminal_bufnr = buf
            local win_id = vim.fn.bufwinid(terminal_bufnr)
            if win_id ~= -1 then
                terminal_win = win_id
                break
            end
        end
    end


    if terminal_win then
        vim.api.nvim_set_current_win(terminal_win)
    else
        vim.cmd("rightbelow vsplit")
        if terminal_bufnr then
            vim.api.nvim_win_set_buf(0, terminal_bufnr)
        else
            vim.cmd("terminal")
            terminal_bufnr = vim.api.nvim_get_current_buf()
        end
        vim.cmd("vertical resize 40")
    end

    vim.cmd("startinsert")

    return terminal_bufnr
end

vim.keymap.set('n', '<C-w>t', openTerminalRight, {noremap = true, silent = true, desc = 'Open [T]erminal on the right side'})

-- Run python3 on current file
local function runPython()
    local current_file = vim.api.nvim_buf_get_name(0)
    local command = "python3"

    local bufnr = openTerminalRight()

    local job_id = vim.bo[bufnr].channel

    vim.api.nvim_chan_send(job_id,command .. " " .. current_file .. "\n")
end

vim.keymap.set('n', '<leader>rp', runPython, {noremap = true, silent = true, desc = '[R]un [P]ython on current script'})
